module ForemanBootdisk::UnattendedControllerExt
  def find_host_by_ip_or_mac
    request.env['HTTP_X_RHN_PROVISIONING_MAC_0'] = "unknown #{params['mac']}" unless request.env.has_key?('HTTP_X_RHN_PROVISIONING_MAC_0') || params['mac'].nil?
    super
  end
end
