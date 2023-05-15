 locales['foreman_bootdisk'] = locales['foreman_bootdisk'] || {}; locales['foreman_bootdisk']['it'] = {
  "domain": "foreman_bootdisk",
  "locale_data": {
    "foreman_bootdisk": {
      "": {
        "Project-Id-Version": "foreman_bootdisk 21.0.4",
        "Report-Msgid-Bugs-To": "",
        "POT-Creation-Date": "2023-01-05 20:17+0100",
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
      "This type of bootdisk is not allowed. Please contact administrator.": [
        ""
      ],
      "Boot disks": [
        "Dischi d'avvio"
      ],
      "Download generic image": [
        "Scarica immagine generica"
      ],
      "Download host image": [
        "Scarica immagine host"
      ],
      "True for full, false for basic reusable image": [
        "True per immagini complete o false per immagini riutilizzabili di base"
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
        "Immagine '%s' dell'host"
      ],
      "Full host '%s' image": [
        "Immagine '%s' dell'host completa"
      ],
      "Boot disk help": [
        ""
      ],
      "Boot disk Help": [
        ""
      ],
      "Boot disk": [
        "Disco d'avvio"
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
        "Immagine generica"
      ],
      "Unable to find template specified by %s setting": [
        "Impossibile trovare il template usando l'impostazione %s"
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
        "L'host non è in modalità di compilazione, per questo motivo è impossibile eseguire il rendering del template"
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
        "compilazione ISO fallita"
      ],
      "ISO hybrid conversion failed: %s": [
        ""
      ],
      "Back": [
        "Indietro"
      ],
      "Various types of boot disks can be created to provision hosts without the need for PXE services.  Boot disks can be attached to the host (physical or virtual) which boots from the disk, contacts Foreman and begins the OS installation.": [
        "È possibile creare diversi tipi di dischi d'avvio per il provisioning degli host senza la necessità di utilizzare i servizi PXE. I dischi d'avvio possono essere collegati all'host (fisici o virtuali) che esegue l'avvio dal disco, contatta Foreman e inizia l'installazione del sistema operativo."
      ],
      "All images are usable as either ISOs or as disk images, including being written to a USB disk with `dd`.": [
        "Tutte le immagini possono essere utilizzate come ISO o immagini del disco, incluso la scrittura su un disco USB con `dd`."
      ],
      "Host images": [
        ""
      ],
      "These images are used for host. You can find them at host detail page.": [
        ""
      ],
      "Host image": [
        "Immagine host"
      ],
      "Per-host images contain data about a particular host registered in Foreman and set up fully static networking, avoiding the requirement for DHCP.  After networking is configured, they chainload from Foreman, picking up the current OS configuration and build state from the server.": [
        "Le immagini per-host contengono i dati su un particolare host registrato in Foreman e per l'impostazione di un networking completamente statico. Così facendo non sarà necessario utilizzare DHCP. Dopo la configurazione del networking verrà eseguito un caricamento a catena da Foreman, rilevando così la configurazione del sistema operativo corrente e lo stato della compilazione del server."
      ],
      "Once chainloaded, the OS bootloader and installer are downloaded directly from the installation media configured in Foreman, and the provisioning script (kickstart/preseed) is downloaded from Foreman.": [
        "Una volta caricato a catena il bootloader del sistema operativo e l'installer verranno scaricati direttamente del dispositivo di installazione configurato in Foreman, e lo script di provisioning (kickstart/preseed) verrà scaricato da Foreman."
      ],
      "Full host image": [
        "Immagine host completa"
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
        "Le immagini generiche sono immagini del disco riutilizzabili idonee per qualsiasi host registrato in Foreman. È necessario avere un server DNS e DHCP generico per un funzionamento corretto e contattare il server, non necessita prenotazioni DHCP o indirizzi IP statici."
      ],
      "The OS install continues using the installation media configured in Foreman, and it will typically configure static networking, depending on how the OS iPXE template is configured.": [
        "L'installazione del sistema operativo continua usando il dispositivo d'installazione configurato in Foreman, e generalmente configurerà il networking statico in base alla configurazione del template iPXE del sistema operativo."
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
        "Percorso per la directory contentente le immagini iPXE"
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
        "Percorso per la directory contentente le immagini syslinux"
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
        "Template iPXE da usare per i dischi d'avvio degli host specifici"
      ],
      "Generic image template": [
        ""
      ],
      "iPXE template to use for generic host boot disks": [
        "Template iPXE da usare per i dischi d'avvio degli host generici"
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
        "Comando per generare l'immagine ISO, usare genisoimage o mkisofs"
      ],
      "Installation media caching": [
        ""
      ],
      "Installation media files will be cached for full host images": [
        "I file del dispositivo di installazione verranno memorizzati in cache per le immagini host complete"
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
        "Azione remota:"
      ],
      "Import Puppet classes": [
        "Importa classi Puppet"
      ],
      "Import facts": [
        "Importa gli eventi"
      ],
      "Action with sub plans": [
        ""
      ],
      "Plugin for Foreman that creates iPXE-based boot disks to provision hosts without the need for PXE infrastructure.": [
        "Plugin per Foreman in grado di creare i dischi d'avvio basati su iPXE per il provisioning degli host, senza utilizzare infrastrutture PXE."
      ]
    }
  }
};