module ForemanBootdisk
  module RendererMethods
    extend ActiveSupport::Concern

    class_methods do
      def format_bootdisk_chain_url(url, mac)
        u = URI.parse(url)
        ForemanBootdisk.logger.warn("Foreman or proxy is configured with HTTPS, probably not supported by iPXE: #{u}") if u.scheme == 'https'
        u.query = "#{u.query}&mac=#{mac}"
        u.fragment = nil
        u.to_s
      end

      def bootdisk_raise(*args)
        raise ::Foreman::Exception.new(*args)
      end
    end

    def bootdisk_chain_url(mac = self.try(:mac), action = 'iPXE')
      self.class.format_bootdisk_chain_url(foreman_url(action), mac)
    end

    def bootdisk_raise(*args)
      self.class.bootdisk_raise(*args)
    end
  end
end
