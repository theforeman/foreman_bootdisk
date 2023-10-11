 locales['foreman_bootdisk'] = locales['foreman_bootdisk'] || {}; locales['foreman_bootdisk']['sv_SE'] = {
  "domain": "foreman_bootdisk",
  "locale_data": {
    "foreman_bootdisk": {
      "": {
        "Project-Id-Version": "foreman_bootdisk 21.1.0",
        "Report-Msgid-Bugs-To": "",
        "PO-Revision-Date": "2014-02-13 12:12+0000",
        "Last-Translator": "johnny.westerlund <johnny.westerlund@gmail.com>, 2014",
        "Language-Team": "Swedish (Sweden) (http://app.transifex.com/foreman/foreman/language/sv_SE/)",
        "MIME-Version": "1.0",
        "Content-Type": "text/plain; charset=UTF-8",
        "Content-Transfer-Encoding": "8bit",
        "Language": "sv_SE",
        "Plural-Forms": "nplurals=2; plural=(n != 1);",
        "lang": "sv_SE",
        "domain": "foreman_bootdisk",
        "plural_forms": "nplurals=2; plural=(n != 1);"
      },
      "This type of bootdisk is not allowed. Please contact administrator.": [
        ""
      ],
      "Boot disks": [
        "Startdiskar"
      ],
      "Download generic image": [
        "Ladda ner generisk avbildning"
      ],
      "Download host image": [
        "Ladda ner värd avbildning"
      ],
      "True for full, false for basic reusable image": [
        ""
      ],
      "Host is not in build mode": [
        ""
      ],
      "Subnet boot disks": [
        ""
      ],
      "Download subnet generic image": [
        ""
      ],
      "TFTP feature not enabled for subnet %s": [
        ""
      ],
      "Host is not in build mode.": [
        ""
      ],
      "Failed to render boot disk template": [
        ""
      ],
      "Host '%s' image": [
        "Värden '%s' avbildning"
      ],
      "Full host '%s' image": [
        ""
      ],
      "Boot disk help": [
        ""
      ],
      "Boot disk Help": [
        ""
      ],
      "Boot disk": [
        "Startdisk"
      ],
      "Boot disk download not available for %s architecture": [
        ""
      ],
      "Subnet '%s' generic image": [
        ""
      ],
      "Subnet generic image": [
        ""
      ],
      "Generic image": [
        "Generell avbildning"
      ],
      "Unable to find template specified by %s setting": [
        "Går inte att hitta mallen specificerad med inställningen %s"
      ],
      "Generating ISO image for %s": [
        ""
      ],
      "Upload ISO image to datastore for %s": [
        ""
      ],
      "Attach ISO image to CDROM drive for %s": [
        ""
      ],
      "Detach ISO image from CDROM drive for %s": [
        ""
      ],
      "Failed to generate ISO image for instance %{name}: %{message}": [
        ""
      ],
      "Failed to upload ISO image for instance %{name}: %{message}": [
        ""
      ],
      "Failed to attach ISO image to CDROM drive of instance %{name}: %{message}": [
        ""
      ],
      "Failed to detach ISO image from CDROM drive of instance %{name}: %{message}": [
        ""
      ],
      "Host is not in build mode, so the template cannot be rendered": [
        ""
      ],
      "Unable to generate disk template, %{kind} template not found.": [
        ""
      ],
      "Unable to generate disk %{kind} template: %{error}": [
        ""
      ],
      "Please ensure the isolinux/syslinux package(s) are installed.": [
        ""
      ],
      "Please ensure the ipxe-bootimgs package is installed.": [
        ""
      ],
      "Creating new image failed, install truncate utility": [
        ""
      ],
      "Failed to format the ESP image via mkfs.msdos": [
        ""
      ],
      "Failed to create a directory within the ESP image": [
        ""
      ],
      "Ensure %{file} is readable (or update \\\"Grub2 directory\\\" setting)": [
        ""
      ],
      "Unable to mcopy %{file}": [
        ""
      ],
      "ISO build failed": [
        "ISO-bygget misslyckades"
      ],
      "ISO hybrid conversion failed: %s": [
        ""
      ],
      "Back": [
        "Tillbaka"
      ],
      "Various types of boot disks can be created to provision hosts without the need for PXE services.  Boot disks can be attached to the host (physical or virtual) which boots from the disk, contacts Foreman and begins the OS installation.": [
        ""
      ],
      "All images are usable as either ISOs or as disk images, including being written to a USB disk with `dd`.": [
        ""
      ],
      "Host images": [
        ""
      ],
      "These images are used for host. You can find them at host detail page.": [
        ""
      ],
      "Host image": [
        ""
      ],
      "Per-host images contain data about a particular host registered in Foreman and set up fully static networking, avoiding the requirement for DHCP.  After networking is configured, they chainload from Foreman, picking up the current OS configuration and build state from the server.": [
        ""
      ],
      "Once chainloaded, the OS bootloader and installer are downloaded directly from the installation media configured in Foreman, and the provisioning script (kickstart/preseed) is downloaded from Foreman.": [
        ""
      ],
      "Full host image": [
        ""
      ],
      "A variant of the per-host image which contains the OS bootloader embedded inside the disk.  This may be useful if chainloading fails on certain hardware, but has the downside that the image must be regenerated for any change in the OS, bootloader or PXELinux templates.": [
        ""
      ],
      "Generic images": [
        ""
      ],
      "These images are more generic than previous images. You can find them at subnet index page.": [
        ""
      ],
      "Generic images are a reusable disk image that works for any host registered in Foreman.  It requires a basic DHCP and DNS service to function and contact the server, but does not require DHCP reservations or static IP addresses.": [
        ""
      ],
      "The OS install continues using the installation media configured in Foreman, and it will typically configure static networking, depending on how the OS iPXE template is configured.": [
        ""
      ],
      "Subnet image": [
        ""
      ],
      "Subnet images are similar to generic images, but chain-loading is done via the TFTP Smart Proxy assigned to the Subnet of the host. The smart proxy must have the \\\"Templates\\\" module enabled and configured.": [
        ""
      ],
      "This image is generic for all hosts with a provisioning NIC on that subnet.": [
        ""
      ],
      "* - These bootdisk types were disabled, you can enable them in Administer - Settings.": [
        ""
      ],
      "Boot disk based": [
        ""
      ],
      "iPXE directory": [
        ""
      ],
      "Path to directory containing iPXE images": [
        "Sökvägen till ett bibliotek med iPXE-avbildningar"
      ],
      "ISOLINUX directory": [
        ""
      ],
      "Path to directory containing isolinux images": [
        ""
      ],
      "SYSLINUX directory": [
        ""
      ],
      "Path to directory containing syslinux images": [
        "Sökvägen till ett bibliotek med syslinux-avbildningar"
      ],
      "Grub2 directory": [
        ""
      ],
      "Path to directory containing grubx64.efi and shimx64.efi": [
        ""
      ],
      "Host image template": [
        ""
      ],
      "iPXE template to use for host-specific boot disks": [
        "iPXE-mall att använda för värdspecifik startdisk"
      ],
      "Generic image template": [
        ""
      ],
      "iPXE template to use for generic host boot disks": [
        "iPXE-mall att använda som generell startdisk fär värdar"
      ],
      "Generic Grub2 EFI image template": [
        ""
      ],
      "iPXE template to use for generic EFI host boot disks": [
        ""
      ],
      "ISO generation command": [
        ""
      ],
      "Command to generate ISO image, use genisoimage or mkisofs": [
        "Kommando för att generera ISO-avbildningar, använd genisoimage eller mkisofs"
      ],
      "Installation media caching": [
        ""
      ],
      "Installation media files will be cached for full host images": [
        ""
      ],
      "Allowed bootdisk types": [
        ""
      ],
      "List of allowed bootdisk types, remove type to disable it": [
        ""
      ],
      "Not available": [
        ""
      ],
      "Remote action:": [
        ""
      ],
      "Import Puppet classes": [
        ""
      ],
      "Import facts": [
        ""
      ],
      "Action with sub plans": [
        ""
      ],
      "Plugin for Foreman that creates iPXE-based boot disks to provision hosts without the need for PXE infrastructure.": [
        "Plugin för Foreman som skapar iPXE-baserad start disk för att provisionera värdar utan en existerande PXE-infrastruktur."
      ]
    }
  }
};