require 'test_plugin_helper'

class ForemanBootdisk::IsoGeneratorTest < ActiveSupport::TestCase
  include ForemanBootdiskTestHelper
  setup :setup_bootdisk
  setup :setup_org_loc
  setup :setup_subnet
  setup :setup_host

  setup do
    @host.build = true
  end

  test "generate_full_host creates with ISO-compatible file names" do
    @host.expects(:generate_pxe_template).with(:PXELinux).returns("Fake kernel line boot/Debian-8.1-x86_64-vmlinuz")
    boot_files = [
      {:"boot/Debian-8.1-x86_64"=>"/tmp/pxeboot/vmlinuz"},
      {:"boot/Debian-8.1-x86_64"=>"/tmp/pxeboot/initrd.img"}
    ]
    @host.operatingsystem.expects(:pxe_files).returns(boot_files)
    ForemanBootdisk::ISOGenerator.expects(:generate).with({
      :isolinux => 'Fake kernel line BOOT/DEBIAN_8_1_X86_64_VMLINUZ',
      :files => [[['BOOT/DEBIAN_8_1_X86_64_VMLINUZ', '/tmp/pxeboot/vmlinuz']],
      [['BOOT/DEBIAN_8_1_X86_64_INITRD_IMG', '/tmp/pxeboot/initrd.img']]] }, anything)
    ForemanBootdisk::ISOGenerator.generate_full_host(@host)
  end

  test "generate_full_host creates with ISO-compatible long file names" do
    @host.expects(:generate_pxe_template).with(:PXELinux).returns("Fake kernel line boot/RedHatEnterpriseLinuxAtomic-7.3-x86_64-vmlinuz")
    boot_files = [
      {:"boot/RedHatEnterpriseLinuxAtomic-7.3-x86_64"=>"/tmp/pxeboot/vmlinuz"},
      {:"boot/RedHatEnterpriseLinuxAtomic-7.3-x86_64"=>"/tmp/pxeboot/initrd.img"}
    ]
    @host.operatingsystem.expects(:pxe_files).returns(boot_files)
    ForemanBootdisk::ISOGenerator.expects(:generate).with({
      :isolinux => 'Fake kernel line BOOT/NUXATOMIC_7_3_X86_64_VMLINUZ',
      :files => [[['BOOT/NUXATOMIC_7_3_X86_64_VMLINUZ', '/tmp/pxeboot/vmlinuz']],
        [['BOOT/ATOMIC_7_3_X86_64_INITRD_IMG', '/tmp/pxeboot/initrd.img']]]}, anything)
    ForemanBootdisk::ISOGenerator.generate_full_host(@host)
  end

  test "full host image generation generates via PXELinux type" do
    @host.expects(:generate_pxe_template).with(:PXELinux).returns("Template")
    @host.operatingsystem.expects(:pxe_files).returns([])
    ForemanBootdisk::ISOGenerator.expects(:generate).with({:isolinux => "Template", :files => []}, anything)
    ForemanBootdisk::ISOGenerator.generate_full_host(@host)
  end
end
