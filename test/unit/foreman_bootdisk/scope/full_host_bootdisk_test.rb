require 'test_plugin_helper'

module ForemanBootdisk
  module Scope
    class BootdiskTest < ActiveSupport::TestCase
      let(:operatingsystem) { FactoryBot.create(:ubuntu14_10, :with_media, :with_archs) }
      let(:host) { FactoryBot.build(:host, :managed, operatingsystem: operatingsystem) }
      let(:source) { Foreman::Renderer::Source::String.new(content: 'Test') }
      let(:scope) { ForemanBootdisk::Scope::FullHostBootdisk.new(host: host, source: source) }

      setup do
        MediumProviders::Default.any_instance.stubs(:unique_id).returns('MyMedium01-ZYHBD6OPET')
      end

      describe '@kernel' do
        test 'should match filename on bootdisk' do
          assert_equal 'BOOT/MYMEDIUM01_ZYHBD6OPET_LINUX', scope.instance_variable_get('@kernel')
        end
      end

      describe '@initrd' do
        test 'should match filename on bootdisk' do
          assert_equal 'BOOT/EDIUM01_ZYHBD6OPET_INITRD_GZ', scope.instance_variable_get('@initrd')
        end
      end
    end
  end
end
