# foreman_bootdisk

Foreman's network provisioning model is usually based on PXE, which requires
DHCP and TFTP services.  However many users don't have these available, so
foreman_bootdisk provides both a per-host and generic boot disks to enable
deployments in datacentres without these capabilities.

Boot images are written as hybrid ISO images (usable as ISOs or USB disks),
and booted either from physical media or virtual disk/CDROM (via a lights out
management device).

# Installation

Please see the Foreman wiki for appropriate instructions:

* [Foreman: How to Install a Plugin](http://projects.theforeman.org/projects/foreman/wiki/How_to_Install_a_Plugin)

The gem name is "foreman_bootdisk".  Run `foreman-rake db:migrate`,
`foreman-rake db:seed` after installation.

RPM users can install the "ruby193-rubygem-foreman_bootdisk" or
"rubygem-foreman_bootdisk" packages.

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

# Usage

## Configuration

Some configuration is set under Administer>Settings>Bootdisk in the Foreman UI.

* `bootdisk_ipxe_dir` points to the directory containing ipxe.lkrn
* `bootdisk_syslinux_dir` points to the directory containing syslinux images
* `bootdisk_host_template` is the name of the per-host boot disk template
* `bootdisk_generic_host_template` is the name of the generic boot disk template
* `bootdisk_mkiso_command` is the name of genisoimage/mkisofs on your OS

For per-host images, ensure host IP addresses and subnets are populated, and
the subnet's gateway, subnet mask and DNS resolver(s) are correctly configured
under Infrastructure>Subnets in Foreman.

To permit access to images for non-admin users, add the "Boot disk access" role
to a user or the "download_bootdisk" permission to an existing role.

### Templates

The templates used on the boot disks themselves are read-only so they can be
updated in new versions of the plugin.  To customise, copy the contents to a
new template and set the name in Administer>Settings>Bootdisk.

An OS iPXE provisioning template is required, preferably "Kickstart default
iPXE".  Ensure the OSes are ticked under the Associations tab and that the
iPXE template is selected under the Templates tab on the OS.

Lastly, the OS provision template (i.e. kickstart/preseed) should provide the
static IP details required to configure the OS.  For a kickstart file, the
following configuration will do this:

    network --bootproto <%= @static ? "static" : "dhcp" %> --hostname <%= @host %> <%= "--ip=#{@host.ip} --netmask=#{@host.subnet.mask} --gateway=#{@host.subnet.gateway} --nameserver=#{@host.subnet.dns_primary},#{@host.subnet.dns_secondary}" if @static %>

Foreman's default kickstart file is ready to use.

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
  </tr>
  <tr>
    <td>Per-host image</td>
    <td>No</td>
    <td>No</td>
    <td>No</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td>Generic image</td>
    <td>Yes</td>
    <td>Yes</td>
    <td>No</td>
    <td>Yes</td>
  </tr>
</table>

### Per-host images

Using the host and subnet data in Foreman, per-host images can be created with
fully static networking.  The behaviour is dynamic, as the image chainloads
from Foreman, so the current OS and build state will be provided by Foreman
instead of being stored in the image.

To generate the image from the web interface, view the host page, click the
"Boot disk" button and select "Host 'FQDN' image".

To generate from the command line:

    foreman-rake bootdisk:generate:host NAME=foo.example.com

Optionally set `OUTPUT=/path/foo.iso` to change the output destination.

### Generic image

This provides a single ISO that can be used by all hosts, but since IP details
can't be stored inside, it requires a DHCP pool on the network to bootstrap.
It will boot and contact Foreman for template of a registered host matching a
MAC address or the IP the host was assigned by DHCP.

The installation can continue on either the DHCP or static IP depending on how
the OS iPXE template is configured, and could configure the assigned IP
address statically for the installed system via the kickstart file.

To generate the image from the web interface, view a host page, click the
"Boot disk" button and select "Generic image".

To generate from the command line:

    foreman-rake bootdisk:generate:generic

Optionally set `OUTPUT=/path/foo.iso` to change the output destination.

### Host group images

TODO

### USB images

The ISO images generated are run through `isohybrid` which makes them bootable
as disks too, suitable for copying to a USB device.

Use `dd if=fqdn.iso of=/dev/sdb` or similar to copy the image to a USB disk.
Ensure the device name is correct to avoid writing over the wrong disk.

# Issues

Report issues on the Redmine project: [foreman_bootdisk](http://projects.theforeman.org/projects/bootdisk/issues/new)

## Known issues

* No Debian guidance or templates
* No SELinux policy support

# Copyright

Copyright (c) 2013 Red Hat Inc.

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
