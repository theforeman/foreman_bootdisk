module ForemanBootdisk::HostsControllerExt
  extend ActiveSupport::Concern

  included do
    alias_method :find_by_name_bootiso, :find_by_name
    before_filter :find_by_name_bootiso, :only => %w[bootdisk_iso]
    alias_method_chain :current_permission, :bootdisk if method_defined?(:current_permission)
  end

  def bootdisk_iso
    begin
      tmpl = @host.bootdisk_template_render
    rescue => e
      error _('Failed to render boot disk template: %s') % e
      redirect_to :back
      return
    end

    ForemanBootdisk::ISOGenerator.new(tmpl).generate do |iso|
      send_data File.read(iso), :filename => "#{@host.name}.iso"
    end
  end

  def current_permission_with_bootdisk
    if params[:action] == 'bootdisk_iso'
      'download_bootdisk'
    else
      current_permission_without_bootdisk
    end
  end
end
