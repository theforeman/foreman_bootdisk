 locales['foreman_bootdisk'] = locales['foreman_bootdisk'] || {}; locales['foreman_bootdisk']['en'] = {
  "domain": "foreman_bootdisk",
  "locale_data": {
    "foreman_bootdisk": {
      "": {
        "Project-Id-Version": "foreman_bootdisk 21.2.3",
        "Report-Msgid-Bugs-To": "",
        "PO-Revision-Date": "2014-02-13 12:09+0000",
        "Last-Translator": "Dominic Cleal <dcleal@redhat.com>",
        "Language-Team": "Foreman Team <foreman-dev@googlegroups.com>",
        "Language": "",
        "MIME-Version": "1.0",
        "Content-Type": "text/plain; charset=UTF-8",
        "Content-Transfer-Encoding": "8bit",
        "Plural-Forms": "nplurals=INTEGER; plural=EXPRESSION;",
        "lang": "en",
        "domain": "foreman_bootdisk",
        "plural_forms": "nplurals=INTEGER; plural=EXPRESSION;"
      },
      "* - These bootdisk types were disabled, you can enable them in Administer - Settings.": [
        ""
      ],
      "A variant of the per-host image which contains the OS bootloader embedded inside the disk.  This may be useful if chainloading fails on certain hardware, but has the downside that the image must be regenerated for any change in the OS, bootloader or PXELinux templates.": [
        ""
      ],
      "Action with sub plans": [
        ""
      ],
      "All images are usable as either ISOs or as disk images, including being written to a USB disk with `dd`.": [
        ""
      ],
      "Allowed bootdisk types": [
        ""
      ],
      "Attach ISO image to CDROM drive for %s": [
        ""
      ],
      "Back": [
        ""
      ],
      "Boot disk": [
        ""
      ],
      "Boot disk Help": [
        ""
      ],
      "Boot disk based": [
        ""
      ],
      "Boot disk download not available for %s architecture": [
        ""
      ],
      "Boot disk help": [
        ""
      ],
      "Boot disks": [
        ""
      ],
      "Command to generate ISO image, use genisoimage or mkisofs": [
        ""
      ],
      "Creating new image failed, install truncate utility": [
        ""
      ],
      "Detach ISO image from CDROM drive for %s": [
        ""
      ],
      "Download generic image": [
        ""
      ],
      "Download host image": [
        ""
      ],
      "Download subnet generic image": [
        ""
      ],
      "Ensure %{file} is readable (or update \\\"Grub2 directory\\\" setting)": [
        ""
      ],
      "Failed to attach ISO image to CDROM drive of instance %{name}: %{message}": [
        ""
      ],
      "Failed to create a directory within the ESP image": [
        ""
      ],
      "Failed to detach ISO image from CDROM drive of instance %{name}: %{message}": [
        ""
      ],
      "Failed to format the ESP image via mkfs.msdos": [
        ""
      ],
      "Failed to generate ISO image for instance %{name}: %{message}": [
        ""
      ],
      "Failed to render boot disk template": [
        ""
      ],
      "Failed to upload ISO image for instance %{name}: %{message}": [
        ""
      ],
      "Full host '%s' image": [
        ""
      ],
      "Full host image": [
        ""
      ],
      "Generating ISO image for %s": [
        ""
      ],
      "Generic Grub2 EFI image template": [
        ""
      ],
      "Generic image": [
        ""
      ],
      "Generic image template": [
        ""
      ],
      "Generic images": [
        ""
      ],
      "Generic images are a reusable disk image that works for any host registered in Foreman.  It requires a basic DHCP and DNS service to function and contact the server, but does not require DHCP reservations or static IP addresses.": [
        ""
      ],
      "Grub2 directory": [
        ""
      ],
      "Host '%s' image": [
        ""
      ],
      "Host image": [
        ""
      ],
      "Host image template": [
        ""
      ],
      "Host images": [
        ""
      ],
      "Host is not in build mode": [
        ""
      ],
      "Host is not in build mode, so the template cannot be rendered": [
        ""
      ],
      "Host is not in build mode.": [
        ""
      ],
      "ISO build failed": [
        ""
      ],
      "ISO generation command": [
        ""
      ],
      "ISO hybrid conversion failed: %s": [
        ""
      ],
      "ISOLINUX directory": [
        ""
      ],
      "Import Puppet classes": [
        ""
      ],
      "Import facts": [
        ""
      ],
      "Installation media caching": [
        ""
      ],
      "Installation media files will be cached for full host images": [
        ""
      ],
      "List of allowed bootdisk types, remove type to disable it": [
        ""
      ],
      "Not available": [
        ""
      ],
      "Once chainloaded, the OS bootloader and installer are downloaded directly from the installation media configured in Foreman, and the provisioning script (kickstart/preseed) is downloaded from Foreman.": [
        ""
      ],
      "Path to directory containing grubx64.efi and shimx64.efi": [
        ""
      ],
      "Path to directory containing iPXE images": [
        ""
      ],
      "Path to directory containing isolinux images": [
        ""
      ],
      "Path to directory containing syslinux images": [
        ""
      ],
      "Per-host images contain data about a particular host registered in Foreman and set up fully static networking, avoiding the requirement for DHCP.  After networking is configured, they chainload from Foreman, picking up the current OS configuration and build state from the server.": [
        ""
      ],
      "Please ensure the ipxe-bootimgs package is installed.": [
        ""
      ],
      "Please ensure the isolinux/syslinux package(s) are installed.": [
        ""
      ],
      "Plugin for Foreman that creates iPXE-based boot disks to provision hosts without the need for PXE infrastructure.": [
        ""
      ],
      "Remote action:": [
        ""
      ],
      "SYSLINUX directory": [
        ""
      ],
      "Subnet '%s' generic image": [
        ""
      ],
      "Subnet boot disks": [
        ""
      ],
      "Subnet generic image": [
        ""
      ],
      "Subnet image": [
        ""
      ],
      "Subnet images are similar to generic images, but chain-loading is done via the TFTP Smart Proxy assigned to the Subnet of the host. The smart proxy must have the \\\"Templates\\\" module enabled and configured.": [
        ""
      ],
      "TFTP feature not enabled for subnet %s": [
        ""
      ],
      "The OS install continues using the installation media configured in Foreman, and it will typically configure static networking, depending on how the OS iPXE template is configured.": [
        ""
      ],
      "These images are more generic than previous images. You can find them at subnet index page.": [
        ""
      ],
      "These images are used for host. You can find them at host detail page.": [
        ""
      ],
      "This image is generic for all hosts with a provisioning NIC on that subnet.": [
        ""
      ],
      "This type of bootdisk is not allowed. Please contact administrator.": [
        ""
      ],
      "True for full, false for basic reusable image": [
        ""
      ],
      "Unable to find template specified by %s setting": [
        ""
      ],
      "Unable to generate disk %{kind} template: %{error}": [
        ""
      ],
      "Unable to generate disk template, %{kind} template not found.": [
        ""
      ],
      "Unable to mcopy %{file}": [
        ""
      ],
      "Upload ISO image to datastore for %s": [
        ""
      ],
      "Various types of boot disks can be created to provision hosts without the need for PXE services.  Boot disks can be attached to the host (physical or virtual) which boots from the disk, contacts Foreman and begins the OS installation.": [
        ""
      ],
      "iPXE directory": [
        ""
      ],
      "iPXE template to use for generic EFI host boot disks": [
        ""
      ],
      "iPXE template to use for generic host boot disks": [
        ""
      ],
      "iPXE template to use for host-specific boot disks": [
        ""
      ]
    }
  }
};