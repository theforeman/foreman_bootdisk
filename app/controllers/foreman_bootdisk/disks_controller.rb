# frozen_string_literal: true

require 'uri'

module ForemanBootdisk
  class DisksController < ::ApplicationController
    include AllowedActions

    before_action :bootdisk_type_allowed?, except: :help
    before_action :find_resource, only: %w[host full_host subnet]

    # as this engine is isolated, we need to include url helpers from core explicitly
    # to render help page layout
    include Rails.application.routes.url_helpers

    def generic
      begin
        # EFI not supported for iPXE generic bootdisk
        tmpl = ForemanBootdisk::Renderer.new.generic_template_render
      rescue StandardError => e
        error_rendering(e)
        redirect_back(fallback_location: '/')
        return
      end

      ForemanBootdisk::ISOGenerator.generate(ipxe: tmpl) do |iso|
        send_file(iso, filename: "bootdisk_#{URI.parse(Setting[:foreman_url]).host}.iso")
      end
    end

    def host
      host = @disk
      begin
        # EFI not supported for iPXE host bootdisk
        tmpl = host.bootdisk_template_render
      rescue StandardError => e
        error_rendering(e)
        redirect_back(fallback_location: '/')
        return
      end

      ForemanBootdisk::ISOGenerator.generate(ipxe: tmpl) do |iso|
        send_file(iso, filename: "#{host.name}.iso")
      end
    end

    def full_host
      host = @disk
      ForemanBootdisk::ISOGenerator.generate_full_host(host) do |iso|
        send_file(iso, filename: "#{host.name}#{ForemanBootdisk::ISOGenerator.token_expiry(host)}.iso")
      end
    end

    def subnet
      host = @disk
      begin
        subnet = host.try(:subnet) || raise(::Foreman::Exception.new(N_('Subnet is not assigned to the host %s'), host.name))
        subnet.tftp || raise(::Foreman::Exception.new(N_('TFTP feature not enabled for subnet %s'), subnet.name))
        subnet.httpboot || ForemanBootdisk.logger.warn('HTTPBOOT feature is not enabled for subnet %s, UEFI may not be available for bootdisk' % subnet.name)

        tmpl_bios = ForemanBootdisk::Renderer.new.generic_template_render(subnet)
        tmpl_efi = ForemanBootdisk::Renderer.new.generic_efi_template_render(subnet)
      rescue StandardError => e
        error_rendering(e)
        redirect_back(fallback_location: '/')
        return
      end

      ForemanBootdisk::ISOGenerator.generate(ipxe: tmpl_bios, grub: tmpl_efi) do |iso|
        send_file(iso, filename: "bootdisk_subnet_#{subnet.name}.iso")
      end
    end

    def help; end

    private

    def resource_scope(_controller = controller_name)
      Host::Managed.authorized(:view_hosts)
    end

    def error_rendering(exception)
      msg = _('Failed to render boot disk template')
      error("#{msg}: #{exception.message}")
      ::Foreman::Logging.exception(msg, exception)
    end
  end
end
