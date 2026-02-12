# frozen_string_literal: true

require 'test_plugin_helper'

module ForemanBootdisk
  class LibvirtTest < ActiveSupport::TestCase
    class DummyLibvirtComputeResource
      prepend ForemanBootdisk::ComputeResources::Libvirt

      attr_reader :client

      def initialize(client, volumes = [])
        @client = client
        @volumes = volumes
      end

      def capabilities
        [:image]
      end

      def volumes
        @volumes
      end

      def set_boot_order(_attr = {})
        %w[hd]
      end
    end

    setup do
      @client = mock('client')
      @cr = DummyLibvirtComputeResource.new(@client, [OpenStruct.new(pool_name: 'bootdisk')])
    end

    describe '#capabilities' do
      test 'should include bootdisk' do
        assert_includes @cr.capabilities, :bootdisk
      end
    end

    describe '#iso_upload' do
      test 'calls fog-libvirt upload_iso' do
        @client.expects(:upload_iso).with('bootdisk', 'test.iso', '/tmp/test.iso')
        @cr.iso_upload('/tmp/test.iso', '1234')
      end
    end

    describe '#iso_attach' do
      test 'calls fog-libvirt attach_iso' do
        @client.expects(:attach_iso).with('1234', 'test.iso')
        @cr.iso_attach('test.iso', '1234')
      end
    end

    describe '#iso_detach' do
      test 'calls fog-libvirt detach_iso' do
        @client.expects(:detach_iso).with('1234', nil)
        @cr.iso_detach('1234')
      end
    end

    describe '#iso_delete' do
      test 'calls fog-libvirt destroy_iso' do
        @client.expects(:destroy_iso).with('bootdisk', 'test.iso')
        @cr.iso_delete('test.iso')
      end
    end

    describe '#set_boot_order' do
      test 'prepends cdrom when provision_method is bootdisk' do
        order = @cr.set_boot_order(provision_method: 'bootdisk')
        assert_equal %w[cdrom network hd], order
      end

      test 'returns base order when provision_method is not bootdisk' do
        order = @cr.set_boot_order(provision_method: 'image')
        assert_equal %w[hd], order
      end
    end
  end
end
