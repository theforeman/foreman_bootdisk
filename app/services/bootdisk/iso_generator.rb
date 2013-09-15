# Generates an iPXE ISO image
#
# requires syslinux, ipxe/ipxe-bootimgs, mkisofs
class Bootdisk::ISOGenerator
  attr_reader :script

  def initialize(script, opts = {})
    @script = script
  end

  def generate(&block)
    Dir.mktmpdir('bootdisk') do |wd|
      Dir.mkdir(File.join(wd, 'build'))
      file = File.new(File.join(wd, 'build', 'isolinux.cfg'),'w')
      file.write(<<EOF)
default ipxe
label ipxe
kernel /ipxe
initrd /script
EOF
      file.close

      FileUtils.cp(File.join(Setting[:bootdisk_syslinux_dir], 'isolinux.bin'), File.join(wd, 'build', 'isolinux.bin'))
      FileUtils.cp(File.join(Setting[:bootdisk_ipxe_dir], 'ipxe.lkrn'), File.join(wd, 'build', 'ipxe'))
      File.write(File.join(wd, 'build', 'script'), script)
      file = File.new(File.join(wd, 'build', 'script'),'w')
      file.write(script)
      file.close

      iso = File.join(wd, 'output.iso')
      unless system("mkisofs -o #{iso} -b isolinux.bin -c boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table #{File.join(wd, 'build')}")
        raise ::Foreman::Exception.new(N_("ISO build failed"))
      end

      yield iso
    end
  end
end
