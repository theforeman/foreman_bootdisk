# frozen_string_literal: true

require 'test_plugin_helper'

module ForemanBootdisk
  class RendererTest < ActiveSupport::TestCase
    include ForemanBootdiskTestHelper

    setup do
      User.current = users(:admin)
      setup_bootdisk
    end

    let(:renderer) { ForemanBootdisk::Renderer.new }

    describe 'a generic template' do
      test 'can be rendered' do
        rendered_template = renderer.generic_template_render
        assert_includes rendered_template, 'ifstat'
      end

      test 'does not include a host token' do
        rendered_template = renderer.generic_template_render
        assert_includes rendered_template, 'http://smart-proxy.example.com/unattended/iPXE?mac=${net0/mac}'
        assert_not_includes rendered_template, 'token'
      end
    end

    context 'with a subnet' do
      let(:subnet) { FactoryBot.create(:subnet_ipv4) }
      test 'renders a subnet template' do
        assert_includes renderer.generic_template_render(subnet), 'ifstat'
      end
    end
  end
end
