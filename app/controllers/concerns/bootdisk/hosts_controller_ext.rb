module Bootdisk::HostsControllerExt
  extend ActiveSupport::Concern

  included do
    alias_method :find_by_name_bootiso, :find_by_name
    before_filter :find_by_name_bootiso, :only => %w[bootdisk_iso]
  end

  def bootdisk_iso
    begin
      tmpl = @host.bootdisk_template_render
    rescue => e
      error _('Failed to render boot disk template: %s') % e
      redirect_to :back
      return
    end

    Bootdisk::ISOGenerator.new(tmpl).generate do |iso|
      send_data File.read(iso), :filename => "#{@host.name}.iso"
    end
  end
end
