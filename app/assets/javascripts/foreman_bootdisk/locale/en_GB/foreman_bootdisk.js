 locales['foreman_bootdisk'] = locales['foreman_bootdisk'] || {}; locales['foreman_bootdisk']['en_GB'] = {
  "domain": "foreman_bootdisk",
  "locale_data": {
    "foreman_bootdisk": {
      "": {
        "Project-Id-Version": "foreman_bootdisk 21.2.3",
        "Report-Msgid-Bugs-To": "",
        "PO-Revision-Date": "2014-02-13 12:12+0000",
        "Last-Translator": "Andi Chandler <andi@gowling.com>, 2015-2017,2023",
        "Language-Team": "English (United Kingdom) (http://app.transifex.com/foreman/foreman/language/en_GB/)",
        "MIME-Version": "1.0",
        "Content-Type": "text/plain; charset=UTF-8",
        "Content-Transfer-Encoding": "8bit",
        "Language": "en_GB",
        "Plural-Forms": "nplurals=2; plural=(n != 1);",
        "lang": "en_GB",
        "domain": "foreman_bootdisk",
        "plural_forms": "nplurals=2; plural=(n != 1);"
      },
      "* - These bootdisk types were disabled, you can enable them in Administer - Settings.": [
        "* - These bootdisk types were disabled, you can enable them in Administer - Settings."
      ],
      "A variant of the per-host image which contains the OS bootloader embedded inside the disk.  This may be useful if chainloading fails on certain hardware, but has the downside that the image must be regenerated for any change in the OS, bootloader or PXELinux templates.": [
        "A variant of the per-host image which contains the OS bootloader embedded inside the disk.  This may be useful if chainloading fails on certain hardware, but has the downside that the image must be regenerated for any change in the OS, bootloader or PXELinux templates."
      ],
      "Action with sub plans": [
        "Action with sub plans"
      ],
      "All images are usable as either ISOs or as disk images, including being written to a USB disk with `dd`.": [
        "All images are usable as either ISOs or as disk images, including being written to a USB disk with `dd`."
      ],
      "Allowed bootdisk types": [
        "Allowed bootdisk types"
      ],
      "Attach ISO image to CDROM drive for %s": [
        "Attach ISO image to CDROM drive for %s"
      ],
      "Back": [
        "Back"
      ],
      "Boot disk": [
        "Boot disk"
      ],
      "Boot disk Help": [
        "Boot disk Help"
      ],
      "Boot disk based": [
        "Boot disk based"
      ],
      "Boot disk download not available for %s architecture": [
        "Boot disk download not available for %s architecture"
      ],
      "Boot disk help": [
        "Boot disk help"
      ],
      "Boot disks": [
        "Boot disks"
      ],
      "Command to generate ISO image, use genisoimage or mkisofs": [
        "Command to generate ISO image, use genisoimage or mkisofs"
      ],
      "Creating new image failed, install truncate utility": [
        "Creating new image failed, install truncate utility"
      ],
      "Detach ISO image from CDROM drive for %s": [
        "Detach ISO image from CDROM drive for %s"
      ],
      "Download generic image": [
        "Download generic image"
      ],
      "Download host image": [
        "Download host image"
      ],
      "Download subnet generic image": [
        "Download subnet generic image"
      ],
      "Ensure %{file} is readable (or update \\\"Grub2 directory\\\" setting)": [
        "Ensure %{file} is readable (or update \\\"Grub2 directory\\\" setting)"
      ],
      "Failed to attach ISO image to CDROM drive of instance %{name}: %{message}": [
        "Failed to attach ISO image to CDROM drive of instance %{name}: %{message}"
      ],
      "Failed to create a directory within the ESP image": [
        "Failed to create a directory within the ESP image"
      ],
      "Failed to detach ISO image from CDROM drive of instance %{name}: %{message}": [
        "Failed to detach ISO image from CDROM drive of instance %{name}: %{message}"
      ],
      "Failed to format the ESP image via mkfs.msdos": [
        "Failed to format the ESP image via mkfs.msdos"
      ],
      "Failed to generate ISO image for instance %{name}: %{message}": [
        "Failed to generate ISO image for instance %{name}: %{message}"
      ],
      "Failed to render boot disk template": [
        "Failed to render boot disk template"
      ],
      "Failed to upload ISO image for instance %{name}: %{message}": [
        "Failed to upload ISO image for instance %{name}: %{message}"
      ],
      "Full host '%s' image": [
        "Full host '%s' image"
      ],
      "Full host image": [
        "Full host image"
      ],
      "Generating ISO image for %s": [
        "Generating ISO image for %s"
      ],
      "Generic Grub2 EFI image template": [
        "Generic Grub2 EFI image template"
      ],
      "Generic image": [
        "Generic image"
      ],
      "Generic image template": [
        "Generic image template"
      ],
      "Generic images": [
        "Generic images"
      ],
      "Generic images are a reusable disk image that works for any host registered in Foreman.  It requires a basic DHCP and DNS service to function and contact the server, but does not require DHCP reservations or static IP addresses.": [
        "Generic images are a reusable disk image that works for any host registered in Foreman.  It requires a basic DHCP and DNS service to function and contact the server, but does not require DHCP reservations or static IP addresses."
      ],
      "Grub2 directory": [
        "Grub2 directory"
      ],
      "Host '%s' image": [
        "Host '%s' image"
      ],
      "Host image": [
        "Host image"
      ],
      "Host image template": [
        "Host image template"
      ],
      "Host images": [
        "Host images"
      ],
      "Host is not in build mode": [
        "Host is not in build mode"
      ],
      "Host is not in build mode, so the template cannot be rendered": [
        "Host is not in build mode, so the template cannot be rendered"
      ],
      "Host is not in build mode.": [
        "Host is not in build mode."
      ],
      "ISO build failed": [
        "ISO build failed"
      ],
      "ISO generation command": [
        "ISO generation command"
      ],
      "ISO hybrid conversion failed: %s": [
        "ISO hybrid conversion failed: %s"
      ],
      "ISOLINUX directory": [
        "ISOLINUX directory"
      ],
      "Import Puppet classes": [
        "Import Puppet classes"
      ],
      "Import facts": [
        "Import facts"
      ],
      "Installation media caching": [
        "Installation media caching"
      ],
      "Installation media files will be cached for full host images": [
        "Installation media files will be cached for full host images"
      ],
      "List of allowed bootdisk types, remove type to disable it": [
        "List of allowed bootdisk types, remove type to disable it"
      ],
      "Not available": [
        "Not available"
      ],
      "Once chainloaded, the OS bootloader and installer are downloaded directly from the installation media configured in Foreman, and the provisioning script (kickstart/preseed) is downloaded from Foreman.": [
        "Once chainloaded, the OS bootloader and installer are downloaded directly from the installation media configured in Foreman, and the provisioning script (kickstart/preseed) is downloaded from Foreman."
      ],
      "Path to directory containing grubx64.efi and shimx64.efi": [
        "Path to directory containing grubx64.efi and shimx64.efi"
      ],
      "Path to directory containing iPXE images": [
        "Path to directory containing iPXE images"
      ],
      "Path to directory containing isolinux images": [
        "Path to directory containing isolinux images"
      ],
      "Path to directory containing syslinux images": [
        "Path to directory containing syslinux images"
      ],
      "Per-host images contain data about a particular host registered in Foreman and set up fully static networking, avoiding the requirement for DHCP.  After networking is configured, they chainload from Foreman, picking up the current OS configuration and build state from the server.": [
        "Per-host images contain data about a particular host registered in Foreman and set up fully static networking, avoiding the requirement for DHCP.  After networking is configured, they chainload from Foreman, picking up the current OS configuration and build state from the server."
      ],
      "Please ensure the ipxe-bootimgs package is installed.": [
        "Please ensure the ipxe-bootimgs package is installed."
      ],
      "Please ensure the isolinux/syslinux package(s) are installed.": [
        "Please ensure the isolinux/syslinux package(s) are installed."
      ],
      "Plugin for Foreman that creates iPXE-based boot disks to provision hosts without the need for PXE infrastructure.": [
        "Plugin for Foreman that creates iPXE-based boot disks to provision hosts without the need for PXE infrastructure."
      ],
      "Remote action:": [
        "Remote action:"
      ],
      "SYSLINUX directory": [
        "SYSLINUX directory"
      ],
      "Subnet '%s' generic image": [
        "Subnet '%s' generic image"
      ],
      "Subnet boot disks": [
        "Subnet boot disks"
      ],
      "Subnet generic image": [
        "Subnet generic image"
      ],
      "Subnet image": [
        "Subnet image"
      ],
      "Subnet images are similar to generic images, but chain-loading is done via the TFTP Smart Proxy assigned to the Subnet of the host. The smart proxy must have the \\\"Templates\\\" module enabled and configured.": [
        "Subnet images are similar to generic images, but chain-loading is done via the TFTP Smart Proxy assigned to the Subnet of the host. The smart proxy must have the \\\"Templates\\\" module enabled and configured."
      ],
      "TFTP feature not enabled for subnet %s": [
        "TFTP feature not enabled for subnet %s"
      ],
      "The OS install continues using the installation media configured in Foreman, and it will typically configure static networking, depending on how the OS iPXE template is configured.": [
        "The OS install continues using the installation media configured in Foreman, and it will typically configure static networking, depending on how the OS iPXE template is configured."
      ],
      "These images are more generic than previous images. You can find them at subnet index page.": [
        "These images are more generic than previous images. You can find them on the subnet index page."
      ],
      "These images are used for host. You can find them at host detail page.": [
        "These images are used for host. You can find them at host detail page."
      ],
      "This image is generic for all hosts with a provisioning NIC on that subnet.": [
        "This image is generic for all hosts with a provisioning NIC on that subnet."
      ],
      "This type of bootdisk is not allowed. Please contact administrator.": [
        "This type of bootdisk is not allowed. Please contact an administrator."
      ],
      "True for full, false for basic reusable image": [
        "True for full, false for basic reusable image"
      ],
      "Unable to find template specified by %s setting": [
        "Unable to find template specified by %s setting"
      ],
      "Unable to generate disk %{kind} template: %{error}": [
        "Unable to generate disk %{kind} template: %{error}"
      ],
      "Unable to generate disk template, %{kind} template not found.": [
        "Unable to generate disk template, %{kind} template not found."
      ],
      "Unable to mcopy %{file}": [
        "Unable to mcopy %{file}"
      ],
      "Upload ISO image to datastore for %s": [
        "Upload ISO image to datastore for %s"
      ],
      "Various types of boot disks can be created to provision hosts without the need for PXE services.  Boot disks can be attached to the host (physical or virtual) which boots from the disk, contacts Foreman and begins the OS installation.": [
        "Various types of boot disks can be created to provision hosts without the need for PXE services.  Boot disks can be attached to the host (physical or virtual) which boots from the disk, contacts Foreman and begins the OS installation."
      ],
      "iPXE directory": [
        "iPXE directory"
      ],
      "iPXE template to use for generic EFI host boot disks": [
        "iPXE template to use for generic EFI host boot disks"
      ],
      "iPXE template to use for generic host boot disks": [
        "iPXE template to use for generic host boot disks"
      ],
      "iPXE template to use for host-specific boot disks": [
        "iPXE template to use for host-specific boot disks"
      ]
    }
  }
};