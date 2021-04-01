# frozen_string_literal: true

module ForemanBootdisk
  module PrettyError
    extend ActiveSupport::Concern

    def error_rendering(exception)
      msg = _('Failed to render boot disk template')
      error("#{msg}: #{exception.message}")
      ::Foreman::Logging.exception(msg, exception)
    end
  end
end
