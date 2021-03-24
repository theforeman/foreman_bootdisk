module AllowedActions
  extend ActiveSupport::Concern

  def bootdisk_type_allowed?(action = params[:action])
    return true if Setting::Bootdisk.allowed_types&.include?(action)

    message = _('This type of bootdisk is not allowed. Please contact administrator.')
    if api_request?
      render_error :custom_error, status: :unprocessable_entity, locals: { message: message}
    else
      error(message)
      redirect_back(fallback_location: '/')
    end
    false
  end
end
