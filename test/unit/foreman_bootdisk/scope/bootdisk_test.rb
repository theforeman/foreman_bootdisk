require 'test_plugin_helper'

module ForemanBootdisk
  module Scope
    class BootdiskTest < ActiveSupport::TestCase
      let(:host) { FactoryBot.build(:host, :managed) }
      let(:source) { Foreman::Renderer::Source::String.new(content: 'Test') }
      let(:scope) { ForemanBootdisk::Scope::Bootdisk.new(host: host, source: source) }

      describe '#bootdisk_chain_url' do
        test 'should render bootdisk chain url' do
          assert_equal "http://foreman.some.host.fqdn/unattended/iPXE?mac=#{URI.encode_www_form_component(host.mac)}", scope.bootdisk_chain_url
        end

        test 'should render bootdisk chain url with custom mac' do
          assert_equal "http://foreman.some.host.fqdn/unattended/iPXE?mac=00%3A11%3A22%3A33%3A44%3A55", scope.bootdisk_chain_url('00:11:22:33:44:55')
        end
      end

      describe '#bootdisk_raise' do
        test 'should raise a Foreman::Exception' do
          assert_raise ::Foreman::Exception do
            scope.bootdisk_raise('Some error.')
          end
        end
      end
    end
  end
end
