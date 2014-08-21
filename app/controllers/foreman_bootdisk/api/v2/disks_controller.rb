require 'uri'

module ForemanBootdisk
  module Api
    module V2
      class DisksController < ::Api::V2::BaseController
        include ::Api::Version2

        resource_description do
          api_base_url "/bootdisk/api"
        end

        before_filter :find_host, :only => :host
        skip_after_filter :log_response_body

        # no-op, but required for apipie documentation
        api :GET, '', N_('Boot disks')
        def index; end

        api :GET, '/generic', N_('Download generic image')
        def generic
          tmpl = ForemanBootdisk::Renderer.new.generic_template_render
          ForemanBootdisk::ISOGenerator.new(tmpl).generate do |iso|
            send_data File.read(iso), :filename => "bootdisk_#{URI.parse(Setting[:foreman_url]).host}.iso"
          end
        end

        api :GET, '/hosts/:host_id', N_('Download host image')
        param :host_id, :identifier_dottable, :required => true
        def host
          host = @disk
          tmpl = host.bootdisk_template_render
          ForemanBootdisk::ISOGenerator.new(tmpl).generate do |iso|
            send_data File.read(iso), :filename => "#{host.name}.iso"
          end
        end

        private

        def action_permission
          case params[:action]
            when 'generic'
              :download
            when 'host'
              :view
          else
            super
          end
        end

        def find_host
          find_resource('hosts')
        end

        def resource_class
          Host::Managed
        end
      end
    end
  end
end
