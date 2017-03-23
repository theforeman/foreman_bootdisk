require 'uri'

module ForemanBootdisk
  class DisksController < ::ApplicationController
    before_filter :find_resource, :only => %w[host full_host subnet]

    def generic
      begin
        tmpl = ForemanBootdisk::Renderer.new.generic_template_render
      rescue => e
        error_rendering(e)
        redirect_to :back
        return
      end

      ForemanBootdisk::ISOGenerator.generate(:ipxe => tmpl) do |iso|
        send_data read_file(iso), :filename => "bootdisk_#{URI.parse(Setting[:foreman_url]).host}.iso"
      end
    end

    def host
      host = @disk
      begin
        tmpl = host.bootdisk_template_render
      rescue => e
        error_rendering(e)
        redirect_to :back
        return
      end

      ForemanBootdisk::ISOGenerator.generate(:ipxe => tmpl) do |iso|
        send_data read_file(iso), :filename => "#{host.name}.iso"
      end
    end

    def full_host
      host = @disk
      ForemanBootdisk::ISOGenerator.generate_full_host(host) do |iso|
        send_data read_file(iso), :filename => "#{host.name}#{ForemanBootdisk::ISOGenerator.token_expiry(host)}.iso"
      end
    end

    def subnet
      host = @disk
      begin
        subnet = host.try(:subnet) || raise(::Foreman::Exception.new(N_("Subnet is not assigned to the host %s"), host.name))
        subnet.tftp || raise(::Foreman::Exception.new(N_("TFTP feature not enabled for subnet %s"), subnet.name))
        tmpl = ForemanBootdisk::Renderer.new.generic_template_render(subnet)
      rescue => e
        error_rendering(e)
        redirect_to :back
        return
      end

      ForemanBootdisk::ISOGenerator.generate(:ipxe => tmpl) do |iso|
        send_data read_file(iso), :filename => "bootdisk_subnet_#{subnet.name}.iso"
      end
    end

    def help
    end

    private

    def read_file(filename)
      File.read(filename)
    end

    def resource_scope(controller = controller_name)
      Host::Managed.authorized(:view_hosts)
    end

    def error_rendering(e)
      msg = _('Failed to render boot disk template')
      error("#{msg}: #{e.message}")
      ::Foreman::Logging.exception(msg, e)
    end
  end
end
