module Bootdisk
  class DisksController < ::ApplicationController
    def generic_iso
      Bootdisk::ISOGenerator.new(Bootdisk::Renderer.new.generic_template_render).generate do |iso|
        send_data File.read(iso), :filename => "bootdisk_#{Setting[:foreman_url]}.iso"
      end
    end
  end
end
