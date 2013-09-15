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

The gem name is "foreman_bootdisk".  Run `foreman-rake db:migrate` after
installation.

RPM users can install the "ruby193-rubygem-foreman_bootdisk" or
"rubygem-foreman_bootdisk" packages.

## Dependencies

* iPXE images are required
* syslinux is required
* mkisofs and isohybrid are required

gPXE images are unsupported due to lack of initrd support, but the name will
crop up as Foreman's script support is still named after the project.

# Usage

## Configuration

Some configuration is set under More>Settings>Bootdisk in the Foreman UI.

* `bootdisk_ipxe_dir` points to the directory containing ipxe.lkrn
* `bootdisk_syslinux_dir` points to the directory containing syslinux images
* `bootdisk_host_template` is the name of the per-host boot disk template

For per-host images, ensure host IP addresses and subnets are populated, and
the subnet's gateway, subnet mask and DNS resolver(s) are correctly configured
under More>Provisioning>Subnets in Foreman.

### Templates

The templates used on the boot disks themselves are read-only so they can be
updated in new versions of the plugin.  To customise, copy the contents to a
new template and set the name in More>Settings>Bootdisk.

An OS gPXE provisioning template is required, e.g. "Kickstart default gPXE"
(as supplied by Foreman).  Ensure the OSes are ticked under the Associations
tab and that the gPXE template is selected under the Templates tab on the OS.

TODO: missing Debian template, kickstart gPXE template assumes `net0`

Lastly, the OS provision template (i.e. kickstart/preseed) should provide the
static IP details required to configure the OS.  For a kickstart file, the
following configuration will do this:

    network --bootproto <%= @static ? "static" : "dhcp" %> --hostname <%= @host %> <%= "--ip=#{@host.ip} --netmask=#{@host.subnet.mask} --gateway=#{@host.subnet.gateway} --nameserver=#{@host.subnet.dns_primary},#{@host.subnet.dns_secondary}" if @static %>

## USB images

The ISO images generated are run through `isohybrid` which makes them bootable
as disks too, suitable for copying to a USB device.

Use `dd if=fqdn.iso of=/dev/sdb` or similar to copy the image to a USB disk.
Ensure the device name is correct to avoid writing over the wrong disk.

## Per-host images

Using the host and subnet data in Foreman, per-host images can be created with
fully static networking.  The behaviour is dynamic, as the image chainloads
from Foreman, so the current OS and build state will be provided by Foreman
instead of being stored in the image.

To generate the image from the web interface, view the host page and click the
"Boot disk" button.

To generate from the command line:

    foreman-rake bootdisk:generate:host NAME=foo.example.com

Optionally set `OUTPUT=/path/foo.iso` to change the output destination.

## Generic host group images

TODO

# Issues

Report issues on the Redmine project: [foreman_bootdisk](http://projects.theforeman.org/projects/bootdisk/issues/new)

## Known issues

* Templates only support first NIC
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
