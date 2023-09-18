 locales['foreman_bootdisk'] = locales['foreman_bootdisk'] || {}; locales['foreman_bootdisk']['fr'] = {
  "domain": "foreman_bootdisk",
  "locale_data": {
    "foreman_bootdisk": {
      "": {
        "Project-Id-Version": "foreman_bootdisk 21.1.0",
        "Report-Msgid-Bugs-To": "",
        "POT-Creation-Date": "2023-09-18 14:01+0200",
        "PO-Revision-Date": "2014-02-13 12:12+0000",
        "Last-Translator": "0868a4d1af5275b3f70b0a6dac4c99a4, 2015",
        "Language-Team": "French (http://app.transifex.com/foreman/foreman/language/fr/)",
        "MIME-Version": "1.0",
        "Content-Type": "text/plain; charset=UTF-8",
        "Content-Transfer-Encoding": "8bit",
        "Language": "fr",
        "Plural-Forms": "nplurals=3; plural=(n == 0 || n == 1) ? 0 : n != 0 && n % 1000000 == 0 ? 1 : 2;",
        "lang": "fr",
        "domain": "foreman_bootdisk",
        "plural_forms": "nplurals=3; plural=(n == 0 || n == 1) ? 0 : n != 0 && n % 1000000 == 0 ? 1 : 2;"
      },
      "This type of bootdisk is not allowed. Please contact administrator.": [
        "Ce type de disque de démarrage n'est pas autorisé. Veuillez contacter l'administrateur."
      ],
      "Boot disks": [
        "Disques de démarrage"
      ],
      "Download generic image": [
        "Télécharger une image générique"
      ],
      "Download host image": [
        "Télécharger une image d'hôte"
      ],
      "True for full, false for basic reusable image": [
        "Vrai pour complète, faux pour une image basique réutilisable"
      ],
      "Host is not in build mode": [
        "L’hôte n’est pas en mode build"
      ],
      "Subnet boot disks": [
        "Sous-réseau des disques de démarrage"
      ],
      "Download subnet generic image": [
        "Télécharger une image générique du sous réseau"
      ],
      "TFTP feature not enabled for subnet %s": [
        "La fonction TFTP n'est pas activée pour le sous-réseau %s"
      ],
      "Host is not in build mode.": [
        "L’hôte n’est pas en mode build"
      ],
      "Failed to render boot disk template": [
        "Impossible d'appliquer le modèle de disque de boot"
      ],
      "Host '%s' image": [
        "Image hôte %s"
      ],
      "Full host '%s' image": [
        "Image complète de l'hôte %s"
      ],
      "Boot disk help": [
        "Aide sur le disque de démarrage"
      ],
      "Boot disk Help": [
        "Aide sur le disque de démarrage"
      ],
      "Boot disk": [
        "Disque de démarrage"
      ],
      "Boot disk download not available for %s architecture": [
        "Téléchargement du disque de démarrage non disponible pour l'architecture %s"
      ],
      "Subnet '%s' generic image": [
        "Image générique du sous-réseau %s"
      ],
      "Subnet generic image": [
        "Image générique du sous-réseau"
      ],
      "Generic image": [
        "Image générique"
      ],
      "Unable to find template specified by %s setting": [
        "Impossible de trouver un modèle spécifié par le paramètre %s"
      ],
      "Generating ISO image for %s": [
        "Création de l'image ISO pour %s"
      ],
      "Upload ISO image to datastore for %s": [
        "Envoi de l'image ISO sur la banque de données pour %s"
      ],
      "Attach ISO image to CDROM drive for %s": [
        "Attachement de l'image ISO au lecteur CDROM pour %s"
      ],
      "Detach ISO image from CDROM drive for %s": [
        "Attachement de l'image ISO au lecteur CDROM pour %s"
      ],
      "Failed to generate ISO image for instance %{name}: %{message}": [
        "Impossible de créer l'image ISO pour l'instance %%{name} : %{message}"
      ],
      "Failed to upload ISO image for instance %{name}: %{message}": [
        "Impossible d'envoyer l'image ISO pour l'instance %%{name} : %{message}"
      ],
      "Failed to attach ISO image to CDROM drive of instance %{name}: %{message}": [
        "Impossible d'attacher l'image ISO au lecteur CDROM de l'instance %{name} : %{message}"
      ],
      "Failed to detach ISO image from CDROM drive of instance %{name}: %{message}": [
        "Impossible d'attacher l'image ISO au lecteur CDROM de l'instance %{name} : %{message}"
      ],
      "Host is not in build mode, so the template cannot be rendered": [
        "L'hôte n'est pas en mode build, c'est pourquoi le modèle ne peut être rendu"
      ],
      "Unable to generate disk template, %{kind} template not found.": [
        "Impossible de générer le modèle de disque, le modèle%{kind} est introuvable."
      ],
      "Unable to generate disk %{kind} template: %{error}": [
        "Impossible de générer le modèle %{kind} de disque : %{error}"
      ],
      "Please ensure the isolinux/syslinux package(s) are installed.": [
        "Veillez à ce que le ou les paquetages isolinux/syslinux soient installés."
      ],
      "Please ensure the ipxe-bootimgs package is installed.": [
        "Veillez à ce que le paquetage ipxe-bootimgs soit installé."
      ],
      "Creating new image failed, install truncate utility": [
        "La création d'une nouvelle image a échoué, installer l'utilitaire de troncation"
      ],
      "Failed to format the ESP image via mkfs.msdos": [
        "Le formatage de l'image ESP via mkfs.msdos a échoué"
      ],
      "Failed to create a directory within the ESP image": [
        "Echec de la création d'un répertoire dans l'image ESP"
      ],
      "Ensure %{file} is readable (or update \\\"Grub2 directory\\\" setting)": [
        "S'assurer que %{file} est lisible (ou mettre à jour le paramètre \\\"répertoire Grub2\\\")"
      ],
      "Unable to mcopy %{file}": [
        "Impossible de mcopier %{file}"
      ],
      "ISO build failed": [
        "La création de l'image ISO a échoué"
      ],
      "ISO hybrid conversion failed: %s": [
        "La conversion de l'image ISO hybride a échoué: %s"
      ],
      "Back": [
        "Précédent"
      ],
      "Various types of boot disks can be created to provision hosts without the need for PXE services.  Boot disks can be attached to the host (physical or virtual) which boots from the disk, contacts Foreman and begins the OS installation.": [
        "Différents types de disque de démarrage peuvent être créés pour provisionner les hôtes sans requérir à PXE. Les disques de démarrage peuvent être attachés à un hôte (physique ou virtuel) qui démarre depuis le disque, contacte Foreman puis lance l'installation du système d'exploitation."
      ],
      "All images are usable as either ISOs or as disk images, including being written to a USB disk with `dd`.": [
        "Toutes les images sont utilisables soit comme ISO soit comme images disque, y compris pour écriture sur disque USB avec 'dd'."
      ],
      "Host images": [
        "Images hôte"
      ],
      "These images are used for host. You can find them at host detail page.": [
        "Ces images sont utilisées pour l'hôte. Vous pouvez les trouver sur la page de détail de l'hôte."
      ],
      "Host image": [
        "Image hôte"
      ],
      "Per-host images contain data about a particular host registered in Foreman and set up fully static networking, avoiding the requirement for DHCP.  After networking is configured, they chainload from Foreman, picking up the current OS configuration and build state from the server.": [
        "Les images par hôte contiennent des données spécifiques pour un hôte donné enregistré dans Foreman et configurent de manière statique les paramètres réseau, ce qui permet de s'affranchir d'un serveur DHCP. Une fois le réseau configuré, ils sont liés depuis Foreman, récupérant la configuration du système d'exploitation et l'état de construction du serveur."
      ],
      "Once chainloaded, the OS bootloader and installer are downloaded directly from the installation media configured in Foreman, and the provisioning script (kickstart/preseed) is downloaded from Foreman.": [
        "Une fois liés, le chargeur de démarrage (bootloader) du système et l'installeur sont téléchargés directement depuis le media d'installation configuré dans Foreman. Le script de provisioning (kickstart/preseed) est également téléchargé depuis Foreman."
      ],
      "Full host image": [
        "Image complète de l'hôte"
      ],
      "A variant of the per-host image which contains the OS bootloader embedded inside the disk.  This may be useful if chainloading fails on certain hardware, but has the downside that the image must be regenerated for any change in the OS, bootloader or PXELinux templates.": [
        "Une variante des images par hôte qui contient le chargeur de démarrage de l'OS dans le disque. Cela peut être utile si le chainage échoue sur certains matériels, mais l'inconvénient est que l'image doit être régénérée à chaque changement du système,du chargeur de démarrage ou des modèles."
      ],
      "Generic images": [
        "Images génériques"
      ],
      "These images are more generic than previous images. You can find them at subnet index page.": [
        "Ces images sont plus génériques que les images précédentes. Vous pouvez les trouver à la page d'index des sous-réseaux."
      ],
      "Generic images are a reusable disk image that works for any host registered in Foreman.  It requires a basic DHCP and DNS service to function and contact the server, but does not require DHCP reservations or static IP addresses.": [
        "Les images génériques correspondent à une image disque réutilisable qui fonctionne pour tout hôte enregistré dans Foreman. Cela demande les services DHCP et DNS fonctionnels mais ne requiert pas de réservation DHCP ni d'adresse IP statique."
      ],
      "The OS install continues using the installation media configured in Foreman, and it will typically configure static networking, depending on how the OS iPXE template is configured.": [
        "L'installation du système d'exploitation continue en utilisant le media d'installation configuré dans Foreman. Cela va généralement configurer le réseau selon la configuration du modèle iPXE du système d'exploitation."
      ],
      "Subnet image": [
        "Image pour le sous-Réseau"
      ],
      "Subnet images are similar to generic images, but chain-loading is done via the TFTP Smart Proxy assigned to the Subnet of the host. The smart proxy must have the \\\"Templates\\\" module enabled and configured.": [
        "Les images pour sous-réseaux sont similaires aux images génériques, mais le chainage est fait par le smart proxy TFTP attribué au sous-réseau de l'hôte. Le smart proxy doit avoir le module \\\"modèles\\\" activé et configuré."
      ],
      "This image is generic for all hosts with a provisioning NIC on that subnet.": [
        "Cette image est générique pour tous les hôtes qui ont une interface réseau configurée en provisioning dans ce sous-réseau."
      ],
      "* - These bootdisk types were disabled, you can enable them in Administer - Settings.": [
        "* - Ces types de disques de démarrage ont été désactivés, vous pouvez les activer dans Administrer - Paramètres."
      ],
      "Boot disk based": [
        "Basé sur le disque de démarrage"
      ],
      "iPXE directory": [
        "Répertoire iPXE"
      ],
      "Path to directory containing iPXE images": [
        "Emplacement du répertoire contenant les images iPXE"
      ],
      "ISOLINUX directory": [
        "Répertoire ISOLINUX"
      ],
      "Path to directory containing isolinux images": [
        "Emplacement du répertoire contenant les images isolinux"
      ],
      "SYSLINUX directory": [
        "Répertoire SYSLINUX"
      ],
      "Path to directory containing syslinux images": [
        "Emplacement du répertoire contenant les images syslinux"
      ],
      "Grub2 directory": [
        "Répertoire Grub2"
      ],
      "Path to directory containing grubx64.efi and shimx64.efi": [
        "Chemin d'accès au répertoire contenant grubx64.efi et shimx64.efi"
      ],
      "Host image template": [
        "Modèle d'image hôte"
      ],
      "iPXE template to use for host-specific boot disks": [
        "Le modèle iPXE à appliquer pour des disques de boot spécifiques à l'hôte"
      ],
      "Generic image template": [
        "Modèle d'image générique"
      ],
      "iPXE template to use for generic host boot disks": [
        "Modèle iPXE à appliquer pour les disques de boot génériques"
      ],
      "Generic Grub2 EFI image template": [
        "Modèle d'image générique Grub2 EFI"
      ],
      "iPXE template to use for generic EFI host boot disks": [
        "Modèle iPXE à utiliser pour les disques d'amorçage génériques de l'hôte EFI"
      ],
      "ISO generation command": [
        "Commande de génération ISO"
      ],
      "Command to generate ISO image, use genisoimage or mkisofs": [
        "Commande servant à générer l'image ISO, utiliser genisoimage ou mkisofs"
      ],
      "Installation media caching": [
        "Mise en cache des médias d'installation"
      ],
      "Installation media files will be cached for full host images": [
        "Les fichiers du media d'installation vont être cachés pour les images complètes d'hôtes"
      ],
      "Allowed bootdisk types": [
        "Types de disques de démarrage autorisés"
      ],
      "List of allowed bootdisk types, remove type to disable it": [
        "Liste des types de disques de démarrage autorisés, supprimer le type pour le désactiver"
      ],
      "Not available": [
        "Non disponible"
      ],
      "Remote action:": [
        "Action distante :"
      ],
      "Import Puppet classes": [
        "Importer des classes Puppet"
      ],
      "Import facts": [
        "Importer des faits"
      ],
      "Action with sub plans": [
        "Action avec sous-plans"
      ],
      "Plugin for Foreman that creates iPXE-based boot disks to provision hosts without the need for PXE infrastructure.": [
        "Plugin pour Foreman qui crée le démarrage des disques iPXE-bases pour provisionner les hôtes sans l'aide de l'infrastructure PXE."
      ]
    }
  }
};