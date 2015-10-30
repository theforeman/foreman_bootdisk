require 'uri'

module ForemanBootdisk
  module Api
    module V2
      class DisksController < ::Api::V2::BaseController
        include ::Api::Version2

        resource_description do
          api_base_url "/bootdisk/api"
        end

        before_filter :find_resource, :only => :host

        skip_after_filter :log_response_body

        # no-op, but required for apipie documentation
        api :GET, '', N_('Boot disks')
        def index; end

        api :GET, '/generic', N_('Download generic image')
        def generic
          tmpl = ForemanBootdisk::Renderer.new.generic_template_render
          ForemanBootdisk::ISOGenerator.generate(:ipxe => tmpl) do |iso|
            send_data File.read(iso), :filename => "bootdisk_#{URI.parse(Setting[:foreman_url]).host}.iso"
          end
        end

        api :GET, '/hosts/:host_id', N_('Download host image')
        param :full, :bool, :required => false, :desc => N_('True for full, false for basic reusable image')
        param :host_id, :identifier_dottable, :required => true
        def host
          host = @disk
          if params[:full]
            ForemanBootdisk::ISOGenerator.generate_full_host(host) do |iso|
              send_data File.read(iso), :filename => "#{host.name}#{ForemanBootdisk::ISOGenerator.token_expiry(host)}.iso"
            end
          else
            tmpl = host.bootdisk_template_render
            ForemanBootdisk::ISOGenerator.generate(:ipxe => tmpl) do |iso|
              send_data File.read(iso), :filename => "#{host.name}.iso"
            end
          end
        end

        private

        def resource_scope
          Host::Managed.authorized('view_hosts')
        end
      end
    end
  end
end
