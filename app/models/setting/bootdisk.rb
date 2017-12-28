class Setting::Bootdisk< ::Setting
  def self.load_defaults
    return unless ApplicationRecord.connection.table_exists?('settings')
    return unless super

    ipxe = ['/usr/lib/ipxe'].find { |p| File.exist?(p) } || '/usr/share/ipxe'
    isolinux = ['/usr/lib/ISOLINUX'].find { |p| File.exist?(p) } || '/usr/share/syslinux'
    syslinux = ['/usr/lib/syslinux/modules/bios', '/usr/lib/syslinux'].find { |p| File.exist?(p) } || '/usr/share/syslinux'
    templates = -> { Hash[ProvisioningTemplate.where(:template_kind => TemplateKind.where(:name => 'Bootdisk')).map{|temp| [temp[:name], temp[:name]]}] }

    Setting.transaction do
      [
        self.set('bootdisk_ipxe_dir', N_('Path to directory containing iPXE images'), ipxe, N_('iPXE directory')),
        self.set('bootdisk_isolinux_dir', N_('Path to directory containing isolinux images'), isolinux, N_('ISOLINUX directory')),
        self.set('bootdisk_syslinux_dir', N_('Path to directory containing syslinux images'), syslinux, N_('SYSLINUX directory')),
        self.set('bootdisk_host_template', N_('iPXE template to use for host-specific boot disks'), 'Boot disk iPXE - host', N_('Host image template'), nil, :collection => templates),
        self.set('bootdisk_generic_host_template', N_('iPXE template to use for generic host boot disks'), 'Boot disk iPXE - generic host', N_('Generic image template'), nil, :collection => templates),
        self.set('bootdisk_mkiso_command', N_('Command to generate ISO image, use genisoimage or mkisofs'), 'genisoimage', N_('ISO generation command')),
        self.set('bootdisk_cache_media', N_('Installation media files will be cached for full host images'), true, N_('Installation media caching')),
      ].compact.each { |s| self.create s.update(:category => "Setting::Bootdisk") }
    end

    true

  end

  def self.humanized_category
    N_('Boot disk')
  end
end
