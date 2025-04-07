# frozen_string_literal: true

require 'test_plugin_helper'

module ForemanBootdisk
  class VmwareTest < ActiveSupport::TestCase
    describe '#create_vm' do
      setup do
        @cr = FactoryBot.build(:vmware_cr)
        @cr.stubs(:test_connection)
      end

      test 'does not call clone_vm when bootdisk provisioning' do
        args = { 'provision_method' => 'bootdisk' }
        mock_vm = mock('vm')
        mock_vm.stubs(:firmware)
        mock_vm.expects(:save).returns(mock_vm)
        @cr.stubs(:parse_networks).returns(args)
        @cr.expects(:clone_vm).times(0)
        @cr.expects(:new_vm).returns(mock_vm)
        @cr.create_vm(args)
      end
    end

    describe '#new_vm' do
      setup do
        @cr = FactoryBot.build(:vmware_cr)
      end

      test 'calls client with cdrom drive and correct boot order when bootdisk provisioning' do
        args = { 'provision_method' => 'bootdisk' }
        mock_client = mock('client')
        mock_servers = mock('servers')
        mock_cdrom = mock('cdrom')
        mock_client.expects(:servers).returns(mock_servers)
        mock_servers.expects(:new).with do |opts|
          assert_equal opts[:boot_order], %w[cdrom disk]
          assert_equal opts[:boot_retry], 10000
          assert_includes opts[:cdroms], mock_cdrom
        end
        @cr.expects(:new_cdrom).returns(mock_cdrom)
        @cr.expects(:new_interface)
        @cr.expects(:new_volume)
        @cr.expects(:datacenter)
        @cr.expects(:client).returns(mock_client)
        @cr.new_vm(args)
      end
    end

    describe '#parse_args' do
      setup do
        @cr = FactoryBot.build(:vmware_cr)
      end

      test 'should add a cdrom drive while keeping other parameters when provision_method is bootdisk' do
        mock_cdrom = mock('cdrom')
        @cr.expects(:new_cdrom).returns(mock_cdrom)
        attrs_in = HashWithIndifferentAccess.new(
          'cpus' => '1',
          :provision_method => 'bootdisk'
        )
        attrs_out = {
          cpus: '1',
          provision_method: 'bootdisk',
          cdroms: [mock_cdrom],
          boot_order: %w[cdrom disk],
          boot_retry: 10000
        }
        assert_equal attrs_out, @cr.parse_args(attrs_in)
      end
    end

    describe '#capabilities' do
      setup do
        @cr = FactoryBot.build(:vmware_cr)
      end

      test 'should include bootdisk' do
        assert_includes @cr.capabilities, :bootdisk
      end
    end
  end
end
