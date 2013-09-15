module Bootdisk
  class DisksController < ::ApplicationController
    include Foreman::Renderer

    def generic_iso
      Bootdisk::ISOGenerator.new(generic_template_render).generate do |iso|
        send_data File.read(iso), :filename => "bootdisk_#{Setting[:foreman_url]}.iso"
      end
    end

    private

    def generic_template_render
      tmpl = ConfigTemplate.find_by_name(Setting[:bootdisk_generic_host_template]) || raise(::Foreman::Exception.new(N_('Unable to find template specified by %s setting'), 'bootdisk_generic_host_template'))
      @host = Struct.new(:token).new(nil)
      unattended_render(tmpl.template)
    end
  end
end
