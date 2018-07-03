require 'test_plugin_helper'

class Host::ManagedTest < ActiveSupport::TestCase
  include ForemanBootdiskTestHelper

  setup do
    User.current = users(:admin)
    setup_bootdisk
  end

  context 'with host' do
    let(:host) { FactoryBot.create(:host, :managed, :with_subnet, build: true) }

    test 'finds the bootdisk_template specified in settings' do
      assert_kind_of ProvisioningTemplate, host.bootdisk_template
    end

    test 'renders the host bootdisk template' do
      assert_includes host.bootdisk_template_render, 'loop_success'
    end
  end
end
