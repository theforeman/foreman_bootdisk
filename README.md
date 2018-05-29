# foreman_bootdisk

Foreman's network provisioning model is usually based on PXE, which requires
DHCP and TFTP services.  However many users don't have these available, so
foreman_bootdisk provides both a per-host and generic boot disks to enable
deployments in datacentres without these capabilities.

Boot images are written as hybrid ISO images (usable as ISOs or USB disks),
and booted either from physical media or virtual disk/CDROM (via a lights out
management device).

# Installation

Please see the Foreman manual for appropriate instructions:

* [Foreman: How to Install a Plugin](http://theforeman.org/manuals/latest/index.html#6.Plugins)

The gem name is "foreman_bootdisk".  Run `foreman-rake db:migrate`,
`foreman-rake db:seed` after installation.

RPM users can install the "tfm-rubygem-foreman_bootdisk" or
"rubygem-foreman_bootdisk" packages.

Debian users can install the "ruby-foreman-bootdisk" package.

## Dependencies

* iPXE images are required
* syslinux is required
* genisoimage/mkisofs and isohybrid are required

gPXE images are unsupported due to lack of initrd support.

## Compatibility

| Foreman Version | Plugin Version |
| --------------- | --------------:|
| <= 1.3          | ~> 1.0         |
| >= 1.4          | ~> 2.0         |
| >= 1.6          | ~> 3.0         |
| >= 1.7          | ~> 4.0         |
| >= 1.8          | ~> 5.0         |
| >= 1.9          | ~> 6.0         |
| >= 1.11         | >= 6.1, < 8.0  |
| >= 1.12         | ~> 8.0         |
| >= 1.13         | ~> 9.0         |
| >= 1.15         | ~> 10.0        |
| >= 1.17         | ~> 11.0        |
| >= 1.18         | ~> 12.0        |

# Usage

## Configuration

With all image types, hosts have to be registered to Foreman prior to booting
the image by hand. Hosts will be identified by their MAC or IP address to provide
the correct provisioning template if the host is in build mode.

For per-host images, ensure host IP addresses and subnets are populated, and
the subnet's gateway, subnet mask and DNS resolver(s) are correctly configured
under Infrastructure>Subnets in Foreman.

To permit access to images for non-admin users, add the "Boot disk access" role
to a user or the "download_bootdisk" permission to an existing role.

## Fully Automated Provisioning

On VMWare compute resources it is possible to create a new host with a cd-drive
preconfigured and have a per-host image attached before first boot. This allows
a fully automated provisioning of hosts via ISO boot. This feature can be used by
selecting the Bootdisk Based provisioning method under the OS tab when creating
the host, or by setting provision_method: "bootdisk" using the API.
Foreman will create an ISO image as part of the orchestration. This image is then
uploaded to a VMWare datastore and attached to the VM.
The user you configured during compute resource setup needs the permissions
`Datastore > Browse Datastore` and `Datastore >  Low level file operations`.

## Templates

An OS iPXE provisioning template is required, see the list below for the name.
Ensure the OSes are ticked under the Associations tab and that the
iPXE template is selected under the Templates tab on the OS.

* Kickstart (EL/Fedora) OSes, use "Kickstart default iPXE"
* Preseed (Debian/Ubuntu) OSes, use "Preseed default iPXE"

Standard templates for the kickstart/preseed and optionally finish script
still need to be associated, as bootdisk only handles bootstrapping.

* EL clones or Fedora should use "Kickstart default" as the "provision"
  template
* RHEL should use "Kickstart RHEL default" as the "provision" template
* Preseed (Debian/Ubuntu) OSes, use "Preseed default" as the
  "provision" template and "Preseed default finish" as the "finish" template

If you're not using Foreman's default kickstart or preseed provisioning
templates, then ensure your versions provide the static IP details required to
configure the OS.  For a kickstart file, the following configuration will do
this:

    network --bootproto <%= @static ? "static" : "dhcp" %> --hostname <%= @host %> <%= "--ip=#{@host.ip} --netmask=#{@host.subnet.mask} --gateway=#{@host.subnet.gateway} --nameserver=#{@host.subnet.dns_primary},#{@host.subnet.dns_secondary}" if @static %>

Foreman's default kickstart and preseed files are ready to use.

## Available images

The image types have trade-offs, but are all meant for environments without
total control over the network infrastructure - so no DHCP reservations or
TFTP settings are needed.

<table>
  <tr>
    <th>Type</th>
    <th>Generic</th>
    <th>DHCP required</th>
    <th>DHCP reservation</th>
    <th>Pre-register host</th>
    <th>OS-specific</th>
  </tr>
  <tr>
    <td>Per-host image</td>
    <td>No</td>
    <td>No</td>
    <td>No</td>
    <td>Yes</td>
    <td>No</td>
  </tr>
  <tr>
    <td>Full host image</td>
    <td>No</td>
    <td>No (*)</td>
    <td>No</td>
    <td>Yes</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td>Generic image</td>
    <td>Yes</td>
    <td>Yes</td>
    <td>No</td>
    <td>Yes</td>
    <td>No</td>
  </tr>
  <tr>
    <td>Subnet image</td>
    <td>Yes</td>
    <td>Yes</td>
    <td>No</td>
    <td>Yes</td>
    <td>No</td>
  </tr>
</table>

(*) - Foreman 1.14 or older do require DHCP

### Per-host images

Using the host and subnet data in Foreman, per-host images can be created with
fully static networking.  The behaviour is dynamic, as the image chainloads
from Foreman, so the current OS and build state will be provided by Foreman
instead of being stored in the image.

To generate the image from the web interface, view the host page, click the
"Boot disk" button and select "Host 'FQDN' image".

To generate using the Hammer CLI, install the [hammer_cli_foreman_bootdisk](https://github.com/theforeman/hammer_cli_foreman_bootdisk)
plugin and run:

    hammer bootdisk host --host client.example.com

See the hammer_cli_foreman_bootdisk documentation for more advanced usage.

To generate from the command line on the Foreman server:

    foreman-rake bootdisk:generate:host NAME=foo.example.com OUTPUT=/tmp

Set `OUTPUT=/path` to change the output destination path (directory or file).
It must be writable by the 'foreman' user.

### Per-host full images

A variant of the per-host image, this version doesn't chainload from Foreman,
but contains the initial OS bootloader.  It can be useful for hosts that fail
to chainload correctly, but has the downsides that it may become out of date
if the host OS, bootloader or PXELinux templates change, or build tokens are
required and expire.  The provisioning template is still fetched from the
Foreman server.

To generate the image from the web interface, view the host page, click the
"Boot disk" button and select "Full host 'FQDN' image".  This image may take
a while to generate, as it downloads the OS bootloaders which can be
considerable in size.

To generate using the Hammer CLI, install the [hammer_cli_foreman_bootdisk](https://github.com/theforeman/hammer_cli_foreman_bootdisk)
plugin and run:

    hammer bootdisk host --host client.example.com --full true

See the hammer_cli_foreman_bootdisk documentation for more advanced usage.

To generate from the command line on the Foreman server:

    foreman-rake bootdisk:generate:full_host NAME=foo.example.com

Set `OUTPUT=/path` to change the output destination path (directory or file).
It must be writable by the 'foreman' user.

### Generic image

This provides a single ISO that can be used by all registered hosts, but since
IP details can't be stored inside, it requires a DHCP pool on the network to
bootstrap.  It will boot and contact Foreman for template of a registered host
matching a MAC address or the IP the host was assigned by DHCP.

The installation can continue on either the DHCP or static IP depending on how
the OS iPXE template is configured, and could configure the assigned IP
address statically for the installed system via the kickstart file.

To generate the image from the web interface, view a host page, click the
"Boot disk" button and select "Generic image".

To generate using the Hammer CLI, install the [hammer_cli_foreman_bootdisk](https://github.com/theforeman/hammer_cli_foreman_bootdisk)
plugin and run:

    hammer bootdisk generic

See the hammer_cli_foreman_bootdisk documentation for more advanced usage.

To generate from the command line on the Foreman server:

    foreman-rake bootdisk:generate:generic

Set `OUTPUT=/path` to change the output destination path (directory or file).
It must be writable by the 'foreman' user.

### Subnet images

Subnet images are similar to generic images, but chain-loading is done via the
TFTP Smart Proxy assigned to the Subnet of the host. The smart proxy must have
the "Templates" module enabled and configured.

This image is generic for all hosts with a provisioning NIC on that subnet.

To generate the image from the web interface, view a host page, click the
"Boot disk" button and select "Subnet image".

To generate using the Hammer CLI, install the [hammer_cli_foreman_bootdisk](https://github.com/theforeman/hammer_cli_foreman_bootdisk)
plugin and run:

    hammer bootdisk subnet --subnet local.lan

See the hammer_cli_foreman_bootdisk documentation for more advanced usage.

To generate from the command line on the Foreman server:

    foreman-rake bootdisk:generate:subnet NAME=subnet-name

Note that foreman-rake does connect to the foreman-proxy.

Set `OUTPUT=/path` to change the output destination path (directory or file).
It must be writable by the 'foreman' user.

### Host group images

TODO

### USB images

The ISO images generated are run through `isohybrid` which makes them bootable
as disks too, suitable for copying to a USB device.

Use `dd if=fqdn.iso of=/dev/sdb` or similar to copy the image to a USB disk.
Ensure the device name is correct to avoid writing over the wrong disk.

## Advanced configuration

### Customising boot disk templates

The templates used on the boot disks themselves are read-only so they can be
updated in new versions of the plugin.  To customise, copy the contents to a
new template and set the name in Administer>Settings>Bootdisk.

* _Host image template_ (`bootdisk_host_template`) is the name of the per-host
  boot disk template
* _Generic image template_ (`bootdisk_generic_host_template`) is the name of
  the generic boot disk template

These templates are baked into the downloaded ISO files and generally don't
need to be modified.

Full host images boot directly into the OS PXELinux template via ISOLinux,
with no intermediate template or bootloader.

### Settings

Some more advanced settings are available under Administer>Settings>Bootdisk in
the Foreman UI.

* _Installation media caching_ (`bootdisk_cache_media`) controls whether to
  cache OS boot files from installation media for full host images
* _iPXE directory_ (`bootdisk_ipxe_dir`) points to the directory containing
  ipxe.lkrn
* _ISO generation command_ (`bootdisk_mkiso_command`) is the name of
  genisoimage/mkisofs on your OS
* _SYSLINUX directory_ (`bootdisk_syslinux_dir`) points to the directory
  containing syslinux images

### RBAC

This plugin provides "Boot disk access" role which requires the following
permissions to be present to allow host and subnet image downloading:

* `view_hosts`
* `view_subnets`

# Issues

Report issues on the Redmine project: [foreman_bootdisk](http://projects.theforeman.org/projects/bootdisk/issues/new)

# Copyright

Copyright (c) 2013-2014 Red Hat Inc.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
