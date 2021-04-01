# frozen_string_literal: true

module ForemanBootdisk
  class SubnetDisksController < ::ApplicationController
    include PrettyError

    before_action :find_resource, only: :subnet

    # as this engine is isolated, we need to include url helpers from core explicitly
    # to render help page layout
    include Rails.application.routes.url_helpers

    def subnet
      begin
        @subnet.tftp || raise(::Foreman::Exception.new(N_('TFTP feature not enabled for subnet %s'), @subnet.name))
        @subnet.httpboot || ForemanBootdisk.logger.warn('HTTPBOOT feature is not enabled for subnet %s, UEFI may not be available for bootdisk' % @subnet.name)

        tmpl_bios = ForemanBootdisk::Renderer.new.generic_template_render(@subnet)
        tmpl_efi = ForemanBootdisk::Renderer.new.generic_efi_template_render(@subnet)
      rescue StandardError => e
        error_rendering(e)
        redirect_back(fallback_location: '/')
        return
      end

      ForemanBootdisk::ISOGenerator.generate(ipxe: tmpl_bios, grub: tmpl_efi) do |iso|
        send_file(iso, filename: "bootdisk_subnet_#{@subnet.name}.iso")
      end
    end

    private

    def resource_scope(_controller = controller_name)
      Subnet.authorized(:view_subnets)
    end

    def find_resource
      @subnet = Subnet.find(params[:id])
    end
  end
end
