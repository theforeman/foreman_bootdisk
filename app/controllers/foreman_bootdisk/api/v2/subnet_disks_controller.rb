# frozen_string_literal: true

require 'uri'

module ForemanBootdisk
  module Api
    module V2
      class SubnetDisksController < ::Api::V2::BaseController
        include ::Api::Version2
        include AllowedActions

        resource_description do
          api_base_url '/bootdisk/api'
        end

        rescue_from ActiveRecord::RecordNotFound, :with => :subnet_not_found
        before_action :bootdisk_type_allowed?, only: :subnet
        before_action :find_resource, only: :subnet

        skip_after_action :log_response_body

        # no-op, but required for apipie documentation
        api :GET, '', N_('Subnet boot disks')
        def index; end

        api :GET, '/subnets/:subnet_id', N_('Download subnet generic image')
        param :subnet_id, :identifier_dottable, required: true
        def subnet
          subnet = @subnet_disk
          subnet.tftp || raise(::Foreman::Exception.new(N_('TFTP feature not enabled for subnet %s'), subnet.name))
          tmpl_bios = ForemanBootdisk::Renderer.new.generic_template_render(subnet)
          tmpl_efi = nil
          if subnet.httpboot
            tmpl_efi = ForemanBootdisk::Renderer.new.generic_efi_template_render(subnet)
          else
            ForemanBootdisk.logger.warn('HTTPBOOT feature is not enabled for subnet %s, UEFI may not be available for bootdisk' % subnet.name)
          end
          ForemanBootdisk::ISOGenerator.generate(ipxe: tmpl_bios, grub: tmpl_efi) do |temp_iso_filename|
            send_file(temp_iso_filename, filename: subnet.name)
          end
        end

        private

        def resource_scope
          Subnet.authorized('view_subnets')
        end

        def subnet_not_found
          not_found ("Subnet not found by id '%s'") % params[:id]
        end
      end
    end
  end
end
