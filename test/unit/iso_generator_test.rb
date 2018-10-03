# frozen_string_literal: true

require 'test_plugin_helper'

module ForemanBootdisk
  class IsoGeneratorTest < ActiveSupport::TestCase
    include ForemanBootdiskTestHelper
    setup :setup_bootdisk

    describe '#generate_full_host' do
      let(:medium) { FactoryBot.create(:medium, name: 'Red Hat Enterprise Linux Atomic Mirror') }
      let(:operatingsystem) { FactoryBot.create(:ubuntu14_10, :with_archs, :with_ptables, media: [medium]) }
      let(:host) { FactoryBot.create(:host, :managed, operatingsystem: operatingsystem, build: true) }
      let(:template) { FactoryBot.create(:provisioning_template, template: 'Fake kernel line <%= @kernel %> - <%= @initrd %>') }

      setup do
        host.expects(:provisioning_template).with(kind: :PXELinux).returns(template)
      end

      test 'generate_full_host creates with ISO-compatible file names' do
        urls = host.operatingsystem.boot_file_sources(host.medium_provider)

        kernel = ForemanBootdisk::ISOGenerator.iso9660_filename(
          host.operatingsystem.kernel(host.medium_provider)
        )
        kernel_url = urls[:kernel]

        initrd = ForemanBootdisk::ISOGenerator.iso9660_filename(
          host.operatingsystem.initrd(host.medium_provider)
        )
        initrd_url = urls[:initrd]

        ForemanBootdisk::ISOGenerator.expects(:generate).with({
                                                                isolinux: "Fake kernel line #{kernel} - #{initrd}",
                                                                files: { kernel => kernel_url,
                                                                         initrd => initrd_url }
                                                              }, anything)

        ForemanBootdisk::ISOGenerator.generate_full_host(host)
      end
    end

    describe '#iso9660_filename' do
      test 'converts path to iso9660' do
        assert_equal 'BOOT/SOME_FILE_N_A_M_E123_', ForemanBootdisk::ISOGenerator.iso9660_filename('boot/some-File-n_a_m_e123Ä')
      end

      test 'shortens long filenames' do
        assert_equal 'BOOT/RPRISELINUXATOMIC_7_3_X86_64', ForemanBootdisk::ISOGenerator.iso9660_filename('boot/RedHatEnterpriseLinuxAtomic-7.3-x86_64')
      end
    end
  end
end
