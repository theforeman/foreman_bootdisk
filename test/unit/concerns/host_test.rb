# frozen_string_literal: true

require 'test_plugin_helper'

module ForemanBootdisk
  class HostTest < ActiveSupport::TestCase
    test '#bootdisk_build? must be true when provision_method is bootdisk' do
      host = FactoryBot.build(:host, :managed)
      host.provision_method = 'bootdisk'
      assert host.bootdisk_build?
      assert_not host.image_build?
      assert_not host.pxe_build?
    end

    test '#validate_media? must be true when provision_method is bootdisk' do
      host = FactoryBot.build(:host, :managed,
                              provision_method: 'bootdisk',
                              build: true)
      assert host.validate_media?
    end

    test '#can_be_built? must be true when provision_method is bootdisk' do
      host = FactoryBot.build(:host, :managed,
                              provision_method: 'bootdisk')
      assert host.can_be_built?
    end

    test 'host should have bootdisk' do
      h = FactoryBot.build(:host, :managed,
                           provision_method: 'bootdisk')
      assert h.bootdisk?
    end

    test 'host should not have bootdisk' do
      h = FactoryBot.create(:host)
      assert_not(h.bootdisk?)
    end

    context '#bootdisk_downloadable?' do
      test 'should be true for 64 bit architecture' do
        architecture = Architecture.where(name: 'x86_64').first
        host = FactoryBot.build(:host, :managed, architecture: architecture)

        assert host.bootdisk_downloadable?
      end

      test 'should be true for 32 bit architecture' do
        architecture = FactoryBot.create(:architecture, name: 'i386')
        host = FactoryBot.build(:host, :managed, architecture: architecture)

        assert host.bootdisk_downloadable?
      end

      test 'should be false for non-intel architecture' do
        architecture = Architecture.where(name: 's390').first
        host = FactoryBot.build(:host, :managed, architecture: architecture)

        assert_not host.bootdisk_downloadable?
      end

      test 'should be true if architecture is absent' do
        host = FactoryBot.build(:host, :managed, architecture: nil)

        assert_nil host.architecture
        assert host.bootdisk_downloadable?
      end
    end

    context '#bootdisk_build?' do
      test 'should be false for hosts without bootdisk' do
        host = FactoryBot.create(:host)
        assert_not host.bootdisk_build?
      end

      test 'should be available in safe mode' do
        assert Host::Managed::Jail.allowed?(:bootdisk_build?)
      end
    end
  end
end
