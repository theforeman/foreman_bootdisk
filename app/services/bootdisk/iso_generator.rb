# Generates an iPXE ISO hybrid image
#
# requires syslinux, ipxe/ipxe-bootimgs, mkisofs, isohybrid
class Bootdisk::ISOGenerator
  attr_reader :script

  def initialize(script, opts = {})
    @script = script
  end

  def generate(&block)
    Dir.mktmpdir('bootdisk') do |wd|
      Dir.mkdir(File.join(wd, 'build'))
      File.open(File.join(wd, 'build', 'isolinux.cfg'),'w') do |file|
        file.write(<<EOF)
default ipxe
label ipxe
kernel /ipxe
initrd /script
EOF
      end

      unless (File.exists?(File.join(Setting[:bootdisk_ipxe_dir], 'ipxe.lkrn')) &&
              (File.exists?(File.join(Setting[:bootdisk_syslinux_dir], 'isolinux.bin'))))
        raise ::Foreman::Exception.new(N_("Please ensure the ipxe-bootimgs and syslinux packages are installed."))
      end

      FileUtils.cp(File.join(Setting[:bootdisk_syslinux_dir], 'isolinux.bin'), File.join(wd, 'build', 'isolinux.bin'))
      FileUtils.cp(File.join(Setting[:bootdisk_ipxe_dir], 'ipxe.lkrn'), File.join(wd, 'build', 'ipxe'))
      File.open(File.join(wd, 'build', 'script'),'w') { |file| file.write(script) }

      iso = File.join(wd, 'output.iso')
      unless system("mkisofs -o #{iso} -b isolinux.bin -c boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table #{File.join(wd, 'build')}")
        raise ::Foreman::Exception.new(N_("ISO build failed"))
      end

      # Make the ISO bootable as a HDD/USB disk too
      unless system("isohybrid", iso)
        raise ::Foreman::Exception.new(N_("ISO hybrid conversion failed"))
      end

      yield iso
    end
  end
end
