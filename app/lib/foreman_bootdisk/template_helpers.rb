# frozen_string_literal: true

module ForemanBootdisk
  module TemplateHelpers
    extend ApipieDSL::Class

    apipie :class, 'Macros related to provisioning via boot disk' do
      name 'Bootdisk'
      sections only: %w[all provisioning]
    end

    apipie :method, 'Generates URL for boot chain' do
      optional :mac, String, 'MAC address of the host', default: 'MAC address of the current host'
      optional :action, String, 'Bootloader to use', default: 'iPXE'
      returns String, desc: 'URL for boot chain'
      example 'bootdisk_chain_url #=> "http://foreman.example.com/unattended/iPXE?mac=00%3A11%3A22%3A33%3A44%3A55"'
      example 'bootdisk_chain_url("00:11:22:33:44:55") #=> "http://foreman.example.com/unattended/iPXE?mac=00%3A11%3A22%3A33%3A44%3A55"'
    end
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

    apipie :method, 'Always raises an error with a description provided as an argument' do
      desc 'This method is useful for aborting script execution if some of the conditions are not met'
      list :args, desc: 'Description for the error'
      raises error: ::Foreman::Exception, desc: 'The error is always being raised'
      returns nil, desc: "Doesn't return anything"
      example "<%
        interface = @host.provision_interface #=> interface = nil
        bootdisk_raise(N_('Host has no provisioning interface defined')) unless interface #=> Foreman::Exception is raised and the execution of the script is aborted
      %>"
    end
    def bootdisk_raise(*args)
      raise ::Foreman::Exception.new(*args)
    end

    def template_name
      "Foreman Bootdisk"
    end
  end
end
