# frozen_string_literal: true

require 'test_plugin_helper'

module ForemanBootdisk
  class ProxmoxTest < ActiveSupport::TestCase

    describe '#capabilities' do
      setup do
        skip unless ForemanBootdisk.with_proxmox?
        @cr = FactoryBot.build(:proxmox_cr)
      end

      test 'should include bootdisk' do
        assert_includes @cr.capabilities, :bootdisk
      end
    end
  end
end
