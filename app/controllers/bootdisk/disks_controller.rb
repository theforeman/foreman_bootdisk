require 'uri'

module Bootdisk
  class DisksController < ::ApplicationController
    def generic_iso
      begin
        tmpl = Bootdisk::Renderer.new.generic_template_render
      rescue => e
        error _('Failed to render boot disk template: %s') % e
        redirect_to :back
        return
      end

      Bootdisk::ISOGenerator.new(tmpl).generate do |iso|
        send_data File.read(iso), :filename => "bootdisk_#{URI.parse(Setting[:foreman_url]).host}.iso"
      end
    end

    private

    def action_permission
      case params[:action]
        when 'generic_iso'
          :download
      else
        super
      end
    end
  end
end
