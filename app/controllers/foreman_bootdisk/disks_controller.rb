require 'uri'

module ForemanBootdisk
  class DisksController < ::ApplicationController
    before_filter :find_by_name, :only => %w[host full_host]

    def generic
      begin
        tmpl = ForemanBootdisk::Renderer.new.generic_template_render
      rescue => e
        error _('Failed to render boot disk template: %s') % e
        redirect_to :back
        return
      end

      ForemanBootdisk::ISOGenerator.generate(:ipxe => tmpl) do |iso|
        send_data File.read(iso), :filename => "bootdisk_#{URI.parse(Setting[:foreman_url]).host}.iso"
      end
    end

    def host
      host = @disk
      begin
        tmpl = host.bootdisk_template_render
      rescue => e
        error _('Failed to render boot disk template: %s') % e
        redirect_to :back
        return
      end

      ForemanBootdisk::ISOGenerator.generate(:ipxe => tmpl) do |iso|
        send_data File.read(iso), :filename => "#{host.name}.iso"
      end
    end

    def full_host
      host = @disk
      ForemanBootdisk::ISOGenerator.generate_full_host(host) do |iso|
        send_data File.read(iso), :filename => "#{host.name}#{ForemanBootdisk::ISOGenerator.token_expiry(host)}.iso"
      end
    end

    def help
    end

    private

    def resource_base
      Host::Managed.authorized(:view_hosts)
    end
  end
end
