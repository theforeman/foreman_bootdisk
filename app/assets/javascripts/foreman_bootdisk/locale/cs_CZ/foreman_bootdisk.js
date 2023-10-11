 locales['foreman_bootdisk'] = locales['foreman_bootdisk'] || {}; locales['foreman_bootdisk']['cs_CZ'] = {
  "domain": "foreman_bootdisk",
  "locale_data": {
    "foreman_bootdisk": {
      "": {
        "Project-Id-Version": "foreman_bootdisk 21.1.0",
        "Report-Msgid-Bugs-To": "",
        "PO-Revision-Date": "2014-02-13 12:12+0000",
        "Last-Translator": "Pavel Borecki <pavel.borecki@gmail.com>, 2018-2020",
        "Language-Team": "Czech (Czech Republic) (http://app.transifex.com/foreman/foreman/language/cs_CZ/)",
        "MIME-Version": "1.0",
        "Content-Type": "text/plain; charset=UTF-8",
        "Content-Transfer-Encoding": "8bit",
        "Language": "cs_CZ",
        "Plural-Forms": "nplurals=4; plural=(n == 1 && n % 1 == 0) ? 0 : (n >= 2 && n <= 4 && n % 1 == 0) ? 1: (n % 1 != 0 ) ? 2 : 3;",
        "lang": "cs_CZ",
        "domain": "foreman_bootdisk",
        "plural_forms": "nplurals=4; plural=(n == 1 && n % 1 == 0) ? 0 : (n >= 2 && n <= 4 && n % 1 == 0) ? 1: (n % 1 != 0 ) ? 2 : 3;"
      },
      "This type of bootdisk is not allowed. Please contact administrator.": [
        ""
      ],
      "Boot disks": [
        ""
      ],
      "Download generic image": [
        ""
      ],
      "Download host image": [
        ""
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
        "Obraz stroje „%s“"
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
        "Disk pro zavádění systému"
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
        "Obecný obraz"
      ],
      "Unable to find template specified by %s setting": [
        "Nedaří se nalézt šablonu určenou nastavením %s"
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
        "Sestavení ISO se nezdařilo"
      ],
      "ISO hybrid conversion failed: %s": [
        ""
      ],
      "Back": [
        "Zpět"
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
        "Obraz stroje"
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
        "Založeno na zaváděcím disku"
      ],
      "iPXE directory": [
        "iPXE složka"
      ],
      "Path to directory containing iPXE images": [
        "Popis umístění složky obsahující iPXE obrazy"
      ],
      "ISOLINUX directory": [
        "ISOLINUX složka"
      ],
      "Path to directory containing isolinux images": [
        ""
      ],
      "SYSLINUX directory": [
        "složka se SYSLINUX"
      ],
      "Path to directory containing syslinux images": [
        "Popis umístění obsahující syslinux obrazy"
      ],
      "Grub2 directory": [
        ""
      ],
      "Path to directory containing grubx64.efi and shimx64.efi": [
        ""
      ],
      "Host image template": [
        "Šablona obrazu stroje"
      ],
      "iPXE template to use for host-specific boot disks": [
        ""
      ],
      "Generic image template": [
        "Šablona obecného obrazu"
      ],
      "iPXE template to use for generic host boot disks": [
        ""
      ],
      "Generic Grub2 EFI image template": [
        ""
      ],
      "iPXE template to use for generic EFI host boot disks": [
        ""
      ],
      "ISO generation command": [
        "příkaz pro vytváření ISO obrazu"
      ],
      "Command to generate ISO image, use genisoimage or mkisofs": [
        "Příkaz pro vytvoření ISO obrazu, použijte genisoimage nebo mkisofs"
      ],
      "Installation media caching": [
        "Mezipaměť pro instalační médium"
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
        "Akce na protějšku:"
      ],
      "Import Puppet classes": [
        "Importovat Puppet třídy"
      ],
      "Import facts": [
        "Importovat fakta"
      ],
      "Action with sub plans": [
        "Akce s dílčími plány"
      ],
      "Plugin for Foreman that creates iPXE-based boot disks to provision hosts without the need for PXE infrastructure.": [
        ""
      ]
    }
  }
};