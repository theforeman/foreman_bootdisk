module Bootdisk::HostsControllerExt
  extend ActiveSupport::Concern

  included do
    alias_method :find_by_name_bootiso, :find_by_name
    before_filter :find_by_name_bootiso, :only => %w[bootdisk_iso]
  end

  def bootdisk_iso
    Bootdisk::ISOGenerator.new(@host.bootdisk_template_render).generate do |iso|
      send_data File.read(iso), :filename => "#{@host.name}.iso"
    end
  end
end
