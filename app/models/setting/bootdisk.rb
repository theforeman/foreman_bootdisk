class Setting::Bootdisk< ::Setting
  def self.load_defaults
    return unless ActiveRecord::Base.connection.table_exists?('settings')
    return unless super

    ipxe = ['/usr/lib/ipxe'].find { |p| File.exist?(p) } || '/usr/share/ipxe'
    syslinux = ['/usr/lib/syslinux'].find { |p| File.exist?(p) } || '/usr/share/syslinux'

    Setting.transaction do
      [
        self.set('bootdisk_ipxe_dir', _('Path to directory containing iPXE images'), ipxe),
        self.set('bootdisk_syslinux_dir', _('Path to directory containing syslinux images'), syslinux),
        self.set('bootdisk_host_template', _('gPXE template to use for host-specific boot disks'), 'Boot disk gPXE - host'),
      ].compact.each { |s| self.create s.update(:category => "Setting::Bootdisk") }
    end

    true

  end
end
