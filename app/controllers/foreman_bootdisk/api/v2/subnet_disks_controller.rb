# frozen_string_literal: true

require 'uri'

module ForemanBootdisk
  module Api
    module V2
      class SubnetDisksController < ::Api::V2::BaseController
        include ::Api::Version2

        resource_description do
          api_base_url '/bootdisk/api'
        end

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
          tmpl = ForemanBootdisk::Renderer.new.generic_template_render(subnet)
          ForemanBootdisk::ISOGenerator.generate(ipxe: tmpl) do |iso|
            name = subnet.name
            send_data File.read(iso), filename: "bootdisk_subnet_#{name}.iso"
          end
        end

        private

        def resource_scope
          Subnet.authorized('view_subnets')
        end
      end
    end
  end
end
