module ForemanBootdisk::UnattendedControllerExt
  extend ActiveSupport::Concern

  included do
    alias_method_chain :find_host_by_ip_or_mac, :param_mac
  end

  def find_host_by_ip_or_mac_with_param_mac
    request.env['HTTP_X_RHN_PROVISIONING_MAC_0'] = "unknown #{params['mac']}" unless request.env.has_key?('HTTP_X_RHN_PROVISIONING_MAC_0') || params['mac'].nil?
    find_host_by_ip_or_mac_without_param_mac
  end
end
