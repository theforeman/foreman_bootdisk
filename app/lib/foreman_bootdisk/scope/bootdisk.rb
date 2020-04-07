# frozen_string_literal: true

module ForemanBootdisk
  module Scope
    class Bootdisk < ::Foreman::Renderer::Scope::Provisioning
      def bootdisk_chain_url(mac = host.try(:mac), action = 'iPXE')
        url = foreman_url(action)
        u = URI.parse(url)
        new_query_data = URI.decode_www_form(u.query || '') << ['mac', mac || '']
        new_querystring = URI.encode_www_form(new_query_data)
        u.query = nil
        u.query = new_querystring if new_querystring.present?
        u.fragment = nil
        u.to_s
      end

      def bootdisk_raise(*args)
        raise ::Foreman::Exception.new(*args)
      end

      def template_name
        "Foreman Bootdisk"
      end
    end
  end
end
