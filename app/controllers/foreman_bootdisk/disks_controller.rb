# frozen_string_literal: true

require 'uri'

module ForemanBootdisk
  class DisksController < ::ApplicationController
    include AllowedActions
    include PrettyError

    helper DiskHelper

    before_action :bootdisk_type_allowed?, except: :help

    before_action :find_resource, only: %w[host full_host]

    # as this engine is isolated, we need to include url helpers from core explicitly
    # to render help page layout
    include Rails.application.routes.url_helpers

    def generic
      begin
        # EFI not supported for iPXE generic bootdisk
        tmpl = ForemanBootdisk::Renderer.new.generic_template_render
      rescue StandardError => e
        error_rendering(e)
        redirect_back(fallback_location: '/')
        return
      end

      ForemanBootdisk::ISOGenerator.generate(ipxe: tmpl) do |iso|
        send_file(iso, filename: "bootdisk_#{URI.parse(Setting[:foreman_url]).host}.iso")
      end
    end

    def host
      host = @disk
      begin
        # EFI not supported for iPXE host bootdisk
        tmpl = host.bootdisk_template_render
      rescue StandardError => e
        error_rendering(e)
        redirect_back(fallback_location: '/')
        return
      end

      prolong_token(host)

      ForemanBootdisk::ISOGenerator.generate(ipxe: tmpl) do |iso|
        send_file(iso, filename: "#{host.name}.iso")
      end
    end

    def full_host
      host = @disk

      prolong_token(host)

      ForemanBootdisk::ISOGenerator.generate_full_host(host) do |iso|
        send_file(iso, filename: "#{host.name}#{ForemanBootdisk::ISOGenerator.token_expiry(host)}.iso")
      end
    end

    def help; end

    private

    def resource_scope(_controller = controller_name)
      Host::Managed.authorized(:view_hosts)
    end

    def error_rendering(exception)
      msg = _('Failed to render boot disk template')
      error("#{msg}: #{exception.message}")
      ::Foreman::Logging.exception(msg, exception)
    end

    def prolong_token(host)
      return if Setting[:token_duration] == 0 || host.token.nil?

      # update build token
      token = host.token
      token.update(expires: Time.zone.now + Setting[:token_duration].minutes)
    end
  end
end
