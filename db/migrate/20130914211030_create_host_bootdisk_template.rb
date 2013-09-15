class CreateHostBootdiskTemplate < ActiveRecord::Migration
  def self.up
    ConfigTemplate.find_or_create_by_name(
      :name => 'Boot disk gPXE - host',
      :template_kind_id => TemplateKind.find_by_name('gPXE').try(:id),
      :template => <<EOS
#!ipxe
# Example foreman_bootdisk host template
# This template is rendered for use inside a host-specific boot disk.
#
# Copy this template to customize it, the original is read-only.

# TODO: loop over net* until the host's MAC matches
ifopen net0
set net0/ip <%= @host.ip %>
set net0/netmask <%= @host.subnet.mask %>
set net0/gateway <%= @host.subnet.gateway %>
route

# Note, iPXE can only use one DNS server
set dns <%= @host.subnet.dns_primary %> <%= @host.subnet.dns_secondary %>
set net0/dns ${dns}
set domain <%= @host.domain.to_s %>

# Chainload from Foreman rather than embedding OS info here, so the behaviour
# is entirely dynamic.
chain <%= foreman_url("gPXE") %>
EOS
    )
  end
  
  def self.down
    ConfigTemplate.destroy_all(:name => 'Boot disk gPXE - host')
  end
end
