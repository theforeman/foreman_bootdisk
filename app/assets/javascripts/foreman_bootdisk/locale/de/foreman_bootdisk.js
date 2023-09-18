 locales['foreman_bootdisk'] = locales['foreman_bootdisk'] || {}; locales['foreman_bootdisk']['de'] = {
  "domain": "foreman_bootdisk",
  "locale_data": {
    "foreman_bootdisk": {
      "": {
        "Project-Id-Version": "foreman_bootdisk 21.1.0",
        "Report-Msgid-Bugs-To": "",
        "POT-Creation-Date": "2023-09-18 14:01+0200",
        "PO-Revision-Date": "2014-02-13 12:12+0000",
        "Last-Translator": "pdolinic, 2021",
        "Language-Team": "German (http://app.transifex.com/foreman/foreman/language/de/)",
        "MIME-Version": "1.0",
        "Content-Type": "text/plain; charset=UTF-8",
        "Content-Transfer-Encoding": "8bit",
        "Language": "de",
        "Plural-Forms": "nplurals=2; plural=(n != 1);",
        "lang": "de",
        "domain": "foreman_bootdisk",
        "plural_forms": "nplurals=2; plural=(n != 1);"
      },
      "This type of bootdisk is not allowed. Please contact administrator.": [
        "Dieser Typ von Bootdisk ist nicht zulässig. Bitte wenden Sie sich an den Administrator."
      ],
      "Boot disks": [
        "Startmedien"
      ],
      "Download generic image": [
        "Generisches Abbild herunterladen"
      ],
      "Download host image": [
        "Host-Abbild herunterladen"
      ],
      "True for full, false for basic reusable image": [
        "\\\"True\\\" für vollständiges, \\\"false\\\" für einfaches wiederverwendbares Image"
      ],
      "Host is not in build mode": [
        "Host befindet sich nicht im Build-Modus"
      ],
      "Subnet boot disks": [
        "Subnetz-Startmedien"
      ],
      "Download subnet generic image": [
        "Generisches Abbild von Subnetz herunterladen"
      ],
      "TFTP feature not enabled for subnet %s": [
        "TFTP-Funktion für Subnetz %s nicht aktiviert"
      ],
      "Host is not in build mode.": [
        "Host befindet sich nicht im Build-Modus."
      ],
      "Failed to render boot disk template": [
        "Fehler beim Rendern der Vorlage für Startmedium"
      ],
      "Host '%s' image": [
        "Host '%s'-Abbild"
      ],
      "Full host '%s' image": [
        "Vollständiges Host \\\"%s\\\"-Abbild"
      ],
      "Boot disk help": [
        ""
      ],
      "Boot disk Help": [
        "Hilfe zur Bootdiskette"
      ],
      "Boot disk": [
        "Startmedium"
      ],
      "Boot disk download not available for %s architecture": [
        "Startmedium Download nicht verfügbar für Architektur %s"
      ],
      "Subnet '%s' generic image": [
        "Subnetz '%s' generisches Abbild"
      ],
      "Subnet generic image": [
        "Generisches Subnetz-Image"
      ],
      "Generic image": [
        "Generisches Abbild"
      ],
      "Unable to find template specified by %s setting": [
        "Konnte Vorlage mit der %s-Einstellung nicht finden"
      ],
      "Generating ISO image for %s": [
        "ISO-Abbild für %s wird erzeugt"
      ],
      "Upload ISO image to datastore for %s": [
        "ISO-Abbild zum Datenspeicher für %s hochladen"
      ],
      "Attach ISO image to CDROM drive for %s": [
        "ISO-Abbild dem CDROM-Laufwerk für %s anhängen"
      ],
      "Detach ISO image from CDROM drive for %s": [
        "Trennen Sie das ISO-Image vom CD-ROM-Laufwerk für %s"
      ],
      "Failed to generate ISO image for instance %{name}: %{message}": [
        "Fehler beim Erzeugen des ISO-Abbild für Instanz %{name}: %{message}"
      ],
      "Failed to upload ISO image for instance %{name}: %{message}": [
        "Fehler beim Upload des ISO-Abbild für Instanz %{name}: %{message}"
      ],
      "Failed to attach ISO image to CDROM drive of instance %{name}: %{message}": [
        "Fehler beim Einhängen des ISO-Abbild am CDROM-Laufwerk für Instanz %{name}: %{message}"
      ],
      "Failed to detach ISO image from CDROM drive of instance %{name}: %{message}": [
        "Fehler beim Trennen des ISO-Image vom CD-ROM-Laufwerk der Instanz %{name}: %{message}"
      ],
      "Host is not in build mode, so the template cannot be rendered": [
        "Host ist nicht im Buildmodus. Daher kann die Vorlage nicht erstellt werden."
      ],
      "Unable to generate disk template, %{kind} template not found.": [
        "Datenträgervorlage kann nicht generiert werden, %{kind}-Vorlage nicht gefunden."
      ],
      "Unable to generate disk %{kind} template: %{error}": [
        "Datenträger %{kind}-Vorlage kann nicht generiert werden: %{error}"
      ],
      "Please ensure the isolinux/syslinux package(s) are installed.": [
        "Bitte die Installation des/der ISOLINUX/SYSLINUX Paket(e) sicherstellen."
      ],
      "Please ensure the ipxe-bootimgs package is installed.": [
        "Bitte die Installation des IPXE-bootimgs Paket sicherstellen."
      ],
      "Creating new image failed, install truncate utility": [
        "Das Erstellen eines neuen Images ist fehlgeschlagen. Installieren Sie die Truncate-Utility"
      ],
      "Failed to format the ESP image via mkfs.msdos": [
        "Fehler beim Formatieren des ESP-Image über mkfs.msdos"
      ],
      "Failed to create a directory within the ESP image": [
        "Fehler beim Erstellen eines Verzeichnisses im ESP-Image"
      ],
      "Ensure %{file} is readable (or update \\\"Grub2 directory\\\" setting)": [
        "Stellen Sie sicher, dass %{file} lesbar ist (oder aktualisieren Sie die Einstellung \\\"Grub2 directory\\\")"
      ],
      "Unable to mcopy %{file}": [
        "%{file} kann nicht mcopy werden"
      ],
      "ISO build failed": [
        "ISO-Erstellung fehlgeschlagen"
      ],
      "ISO hybrid conversion failed: %s": [
        "ISO-Hybrid-Konvertierung fehlgeschlagen: %s"
      ],
      "Back": [
        "Zurück"
      ],
      "Various types of boot disks can be created to provision hosts without the need for PXE services.  Boot disks can be attached to the host (physical or virtual) which boots from the disk, contacts Foreman and begins the OS installation.": [
        "Verschiedene Arten von Startmedien können erstellt werden, um Hosts ohne die Notwendigkeit von PXE-Diensten bereitzustellen. Startmedien können mit dem Host (physisch oder virtuell) verbunden werden, der von der Festplatte bootet, Foreman kontaktiert und die OS-Installation beginnt."
      ],
      "All images are usable as either ISOs or as disk images, including being written to a USB disk with `dd`.": [
        "Alle Abbilder können entweder als ISOs oder als Festplattenabbilder verwendet werden und auch mit `dd` auf eine USB-Festplatte geschrieben."
      ],
      "Host images": [
        "Host-Images"
      ],
      "These images are used for host. You can find them at host detail page.": [
        "Diese Images werden für Host verwendet. Sie finden sie auf der Host-Detailseite."
      ],
      "Host image": [
        "Host-Abbild"
      ],
      "Per-host images contain data about a particular host registered in Foreman and set up fully static networking, avoiding the requirement for DHCP.  After networking is configured, they chainload from Foreman, picking up the current OS configuration and build state from the server.": [
        "\\\"Pro-Host\\\"-Abbilder enthalten Daten über einen bestimmten Host, der in Foreman registriert ist, und richten eine vollständig statische Verbindung ein, wobei die Notwendigkeit von DHCP vermieden wird. Nach der Konfiguration der Verbindung werden sie nacheinander von Foreman geladen (Chainloading) und nehmen die gegenwärtige OS-Konfiguration und den Buildstatus vom Server auf."
      ],
      "Once chainloaded, the OS bootloader and installer are downloaded directly from the installation media configured in Foreman, and the provisioning script (kickstart/preseed) is downloaded from Foreman.": [
        "Sobald sie nacheinander geladen (Chainloading) sind, werden der OS-Bootloader und das OS-Installationsprogramm direkt von den in Foreman konfigurierten Installationsmedien heruntergeladen, und das Bereitstellungsskript (kickstart/preseed) wird von Foreman heruntergeladen."
      ],
      "Full host image": [
        "Vollständiges Host-Abbild"
      ],
      "A variant of the per-host image which contains the OS bootloader embedded inside the disk.  This may be useful if chainloading fails on certain hardware, but has the downside that the image must be regenerated for any change in the OS, bootloader or PXELinux templates.": [
        "Eine Variante des Abbildes pro Host mit im im Medium eingebetteten Betriebssystem-Bootloader. Dies ist hilfreich, falls Chainloading auf einer bestimmten Hardware fehlschlägt, hat jedoch den Nachteil, dass das Abbild bei jeglicher Änderung von Betriebssystem, Bootloader oder PXELinux-Vorlagen neu generiert werden muss."
      ],
      "Generic images": [
        "Generische Images"
      ],
      "These images are more generic than previous images. You can find them at subnet index page.": [
        "Diese Images sind allgemeiner als die vorherigen Images. Sie finden sie auf der Subnetz-Indexseite."
      ],
      "Generic images are a reusable disk image that works for any host registered in Foreman.  It requires a basic DHCP and DNS service to function and contact the server, but does not require DHCP reservations or static IP addresses.": [
        "Generische Abbilder sind wiederverwendbare Festplattenabbilder die für beliebige in Foreman registrierte Hosts funktionieren. Sie erfordern einen einfachen DHCP- und DNS-Service, um zu funktionieren und den Server zu kontaktieren. Jedoch benötigen sie keinerlei DHCP-Reservierungen oder statische IP-Adressen."
      ],
      "The OS install continues using the installation media configured in Foreman, and it will typically configure static networking, depending on how the OS iPXE template is configured.": [
        "Die Installation des Betriebssystems wird unter Verwendung eines in Foreman konfigurierten Installationsmediums fortgesetzt und konfiguriert für gewöhnlich eine statische Verbindung in Abhängigkeit davon, wie die Betriebssystem-iPXE-Vorlage konfiguriert ist."
      ],
      "Subnet image": [
        "Subnetzabbild"
      ],
      "Subnet images are similar to generic images, but chain-loading is done via the TFTP Smart Proxy assigned to the Subnet of the host. The smart proxy must have the \\\"Templates\\\" module enabled and configured.": [
        "Subnetz-Abbilder sind generischen Abbildern ähnlich, aber Chainloading erfolgt über den TFTP Smart Proxy, der dem Host-Subnetz zu gewiesen ist. Das \\\"Vorlagen\\\"-Modul muss auf dem Smart-Proxy aktiviert und konfiguriert sein."
      ],
      "This image is generic for all hosts with a provisioning NIC on that subnet.": [
        "Dieses Abbild ist für alle Hosts mit Provisioning-NIC auf diesem Subnetz generisch."
      ],
      "* - These bootdisk types were disabled, you can enable them in Administer - Settings.": [
        "* - Diese Bootdisk-Typen wurden deaktiviert, Sie können sie unter Verwalten - Einstellungen aktivieren."
      ],
      "Boot disk based": [
        "Startmedium-basiert"
      ],
      "iPXE directory": [
        "iPXE-Verzeichnis"
      ],
      "Path to directory containing iPXE images": [
        "Pfad zum Verzeichnis mit iPXE-Abbildern"
      ],
      "ISOLINUX directory": [
        "ISOLINUX-Verzeichnis"
      ],
      "Path to directory containing isolinux images": [
        "Pfad zum Verzeichnis welches die ISOLINUX Abbilder enthält"
      ],
      "SYSLINUX directory": [
        "SYSLINUX-Verzeichnis"
      ],
      "Path to directory containing syslinux images": [
        "Pfad zum Verzeichnis mit syslinux-Abbildern"
      ],
      "Grub2 directory": [
        "Grub2-Verzeichnis"
      ],
      "Path to directory containing grubx64.efi and shimx64.efi": [
        "Pfad zum Verzeichnis mit grubx64.efi und shimx64.efi"
      ],
      "Host image template": [
        "Host-Abbildvorlage"
      ],
      "iPXE template to use for host-specific boot disks": [
        "iPXE Vorlage zur Verwendung für Host-spezifische Startmedien"
      ],
      "Generic image template": [
        "Generische Abbildvorlage"
      ],
      "iPXE template to use for generic host boot disks": [
        "iPXE Vorlage zur Verwendung für generische Host-Startmedien"
      ],
      "Generic Grub2 EFI image template": [
        "Generische Grub2-EFI-Image-Vorlage"
      ],
      "iPXE template to use for generic EFI host boot disks": [
        ""
      ],
      "ISO generation command": [
        "ISO-Erzeugungsbefehl"
      ],
      "Command to generate ISO image, use genisoimage or mkisofs": [
        "Kommando zur Erstellung von ISO-Abbildern, verwende genisoimage oder mkisofs"
      ],
      "Installation media caching": [
        "Installationsmedien-Dateien Caching"
      ],
      "Installation media files will be cached for full host images": [
        "Installationsmedien-Dateien werden für vollständige Host-Images zwischengespeichert."
      ],
      "Allowed bootdisk types": [
        "Zulässige Bootdisk-Typen"
      ],
      "List of allowed bootdisk types, remove type to disable it": [
        "Liste der zulässigen Bootdisk-Typen, entfernen Sie den Typ, um ihn zu deaktivieren"
      ],
      "Not available": [
        "Nicht verfügbar"
      ],
      "Remote action:": [
        "Entfernte Aktion:"
      ],
      "Import Puppet classes": [
        "Puppet-Klassen importieren"
      ],
      "Import facts": [
        "Fakten importieren"
      ],
      "Action with sub plans": [
        "Aktion mit Unterplänen"
      ],
      "Plugin for Foreman that creates iPXE-based boot disks to provision hosts without the need for PXE infrastructure.": [
        "Plugin für Foreman, welches iPXE-basierte Startmedien erstellt, um Hosts ohne die Notwendigkeit einer PXE-Infrastruktur bereitzustellen."
      ]
    }
  }
};