# frozen_string_literal: true

require 'uri'

module ForemanBootdisk
  class DisksController < ::ApplicationController
    include AllowedActions
    include PrettyError

    helper DiskHelper

    before_action :bootdisk_type_allowed?, except: %i[help bootdisk_options]

    before_action :find_resource, only: %w[host full_host bootdisk_options]

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
      begin
        ForemanBootdisk::ISOGenerator.generate_full_host(host) do |iso|
          send_file(iso, filename: "#{host.name}#{ForemanBootdisk::ISOGenerator.token_expiry(host)}.iso")
        end
      rescue ::Foreman::Exception => e
        raise e unless e.code == 'ERF42-2893'
        error _('Host is not in build mode.')
        redirect_back(fallback_location: '/')
      end
    end

    def help; end

    def bootdisk_options
      host = @disk

      return not_found unless host

      respond_to do |format|
        format.json do
          render json: {
            bootdiskOptions: {
              bootdiskDownloadable: !!host.bootdisk_downloadable?,
              architectureName: host.architecture.name,
              actions: bootdisk_allowed_actions(host),
            },
          }, status: :ok
        end
      end
    end

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

    def bootdisk_allowed_actions(host)
      return [] unless host.bootdisk_downloadable?

      allowed = %w[host full_host].each_with_object([]) do |action, actions|
        opts = {
          controller: 'foreman_bootdisk/disks',
          action: action,
          id: host
        }
        next unless User.current.allowed_to?(opts) && Setting::Bootdisk.allowed_types.include?(action)

        hostname = host.name.split('.')[0]
        title = action == 'host' ? _("Host '%s' image") % hostname : _("Full host '%s' image") % hostname
        disable_full_host = action == 'full_host' && !host.build?
        actions << {
          title: title,
          link: "/bootdisk/disks/#{action}s/#{host.id}",
          disabled:  disable_full_host ? true : false,
          description: disable_full_host ? _('Host is not in build mode') : nil
        }
      end
      return allowed unless User.current.allowed_to?({controller: 'foreman_bootdisk/disks', action: 'help'})

      allowed.push({
        title: _('Boot disk help'),
        link: '/bootdisk/disks/help'
      })
    end
  end
end
