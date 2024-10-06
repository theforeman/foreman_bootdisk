# frozen_string_literal: true

module ForemanBootdisk
  module Scope
    class Bootdisk < ::Foreman::Renderer::Scope::Provisioning
      def template_name
        "Foreman Bootdisk"
      end
    end
  end
end
