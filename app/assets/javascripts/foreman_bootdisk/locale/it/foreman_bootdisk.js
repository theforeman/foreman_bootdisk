 locales['foreman_bootdisk'] = locales['foreman_bootdisk'] || {}; locales['foreman_bootdisk']['it'] = {
  "domain": "foreman_bootdisk",
  "locale_data": {
    "foreman_bootdisk": {
      "": {
        "Project-Id-Version": "foreman_bootdisk 22.0.2",
        "Report-Msgid-Bugs-To": "",
        "PO-Revision-Date": "2014-02-13 12:12+0000",
        "Last-Translator": "FULL NAME <EMAIL@ADDRESS>",
        "Language-Team": "Italian (http://app.transifex.com/foreman/foreman/language/it/)",
        "MIME-Version": "1.0",
        "Content-Type": "text/plain; charset=UTF-8",
        "Content-Transfer-Encoding": "8bit",
        "Language": "it",
        "Plural-Forms": "nplurals=3; plural=n == 1 ? 0 : n != 0 && n % 1000000 == 0 ? 1 : 2;",
        "lang": "it",
        "domain": "foreman_bootdisk",
        "plural_forms": "nplurals=3; plural=n == 1 ? 0 : n != 0 && n % 1000000 == 0 ? 1 : 2;"
      },
      "* - These bootdisk types were disabled, you can enable them in Administer - Settings.": [
        ""
      ],
      "A variant of the per-host image which contains the OS bootloader embedded inside the disk.  This may be useful if chainloading fails on certain hardware, but has the downside that the image must be regenerated for any change in the OS, bootloader or PXELinux templates.": [
        ""
      ],
      "All images are usable as either ISOs or as disk images, including being written to a USB disk with `dd`.": [
        "Tutte le immagini possono essere utilizzate come ISO o immagini del disco, incluso la scrittura su un disco USB con `dd`."
      ],
      "Allowed bootdisk types": [
        ""
      ],
      "Attach ISO image to CDROM drive for %s": [
        ""
      ],
      "Back": [
        "Indietro"
      ],
      "Boot disk": [
        "Disco d'avvio"
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
        "Dischi d'avvio"
      ],
      "Command to generate ISO image, use genisoimage or mkisofs": [
        "Comando per generare l'immagine ISO, usare genisoimage o mkisofs"
      ],
      "Creating new image failed, install truncate utility": [
        ""
      ],
      "Detach ISO image from CDROM drive for %s": [
        ""
      ],
      "Download generic image": [
        "Scarica immagine generica"
      ],
      "Download host image": [
        "Scarica immagine host"
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
        "Immagine '%s' dell'host completa"
      ],
      "Full host image": [
        "Immagine host completa"
      ],
      "Generating ISO image for %s": [
        ""
      ],
      "Generic Grub2 EFI image template": [
        ""
      ],
      "Generic image": [
        "Immagine generica"
      ],
      "Generic image template": [
        ""
      ],
      "Generic images": [
        ""
      ],
      "Generic images are a reusable disk image that works for any host registered in Foreman.  It requires a basic DHCP and DNS service to function and contact the server, but does not require DHCP reservations or static IP addresses.": [
        "Le immagini generiche sono immagini del disco riutilizzabili idonee per qualsiasi host registrato in Foreman. È necessario avere un server DNS e DHCP generico per un funzionamento corretto e contattare il server, non necessita prenotazioni DHCP o indirizzi IP statici."
      ],
      "Grub2 directory": [
        ""
      ],
      "Host '%s' image": [
        "Immagine '%s' dell'host"
      ],
      "Host image": [
        "Immagine host"
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
        "L'host non è in modalità di compilazione, per questo motivo è impossibile eseguire il rendering del template"
      ],
      "Host is not in build mode.": [
        ""
      ],
      "ISO build failed": [
        "compilazione ISO fallita"
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
      "Installation media caching": [
        ""
      ],
      "Installation media files will be cached for full host images": [
        "I file del dispositivo di installazione verranno memorizzati in cache per le immagini host complete"
      ],
      "List of allowed bootdisk types, remove type to disable it": [
        ""
      ],
      "Not available": [
        ""
      ],
      "Once chainloaded, the OS bootloader and installer are downloaded directly from the installation media configured in Foreman, and the provisioning script (kickstart/preseed) is downloaded from Foreman.": [
        "Una volta caricato a catena il bootloader del sistema operativo e l'installer verranno scaricati direttamente del dispositivo di installazione configurato in Foreman, e lo script di provisioning (kickstart/preseed) verrà scaricato da Foreman."
      ],
      "Path to directory containing grubx64.efi and shimx64.efi": [
        ""
      ],
      "Path to directory containing iPXE images": [
        "Percorso per la directory contentente le immagini iPXE"
      ],
      "Path to directory containing isolinux images": [
        ""
      ],
      "Path to directory containing syslinux images": [
        "Percorso per la directory contentente le immagini syslinux"
      ],
      "Per-host images contain data about a particular host registered in Foreman and set up fully static networking, avoiding the requirement for DHCP.  After networking is configured, they chainload from Foreman, picking up the current OS configuration and build state from the server.": [
        "Le immagini per-host contengono i dati su un particolare host registrato in Foreman e per l'impostazione di un networking completamente statico. Così facendo non sarà necessario utilizzare DHCP. Dopo la configurazione del networking verrà eseguito un caricamento a catena da Foreman, rilevando così la configurazione del sistema operativo corrente e lo stato della compilazione del server."
      ],
      "Please ensure the ipxe-bootimgs package is installed.": [
        ""
      ],
      "Please ensure the isolinux/syslinux package(s) are installed.": [
        ""
      ],
      "Plugin for Foreman that creates iPXE-based boot disks to provision hosts without the need for PXE infrastructure.": [
        "Plugin per Foreman in grado di creare i dischi d'avvio basati su iPXE per il provisioning degli host, senza utilizzare infrastrutture PXE."
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
        "L'installazione del sistema operativo continua usando il dispositivo d'installazione configurato in Foreman, e generalmente configurerà il networking statico in base alla configurazione del template iPXE del sistema operativo."
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
        "True per immagini complete o false per immagini riutilizzabili di base"
      ],
      "Unable to find template specified by %s setting": [
        "Impossibile trovare il template usando l'impostazione %s"
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
        "È possibile creare diversi tipi di dischi d'avvio per il provisioning degli host senza la necessità di utilizzare i servizi PXE. I dischi d'avvio possono essere collegati all'host (fisici o virtuali) che esegue l'avvio dal disco, contatta Foreman e inizia l'installazione del sistema operativo."
      ],
      "iPXE directory": [
        ""
      ],
      "iPXE template to use for generic EFI host boot disks": [
        ""
      ],
      "iPXE template to use for generic host boot disks": [
        "Template iPXE da usare per i dischi d'avvio degli host generici"
      ],
      "iPXE template to use for host-specific boot disks": [
        "Template iPXE da usare per i dischi d'avvio degli host specifici"
      ]
    }
  }
};