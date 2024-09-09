 locales['foreman_bootdisk'] = locales['foreman_bootdisk'] || {}; locales['foreman_bootdisk']['fr'] = {
  "domain": "foreman_bootdisk",
  "locale_data": {
    "foreman_bootdisk": {
      "": {
        "Project-Id-Version": "foreman_bootdisk 21.0.4",
        "Report-Msgid-Bugs-To": "",
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
      "* - These bootdisk types were disabled, you can enable them in Administer - Settings.": [
        "* - Ces types de disques de démarrage ont été désactivés, vous pouvez les activer dans Administrer - Paramètres."
      ],
      "A variant of the per-host image which contains the OS bootloader embedded inside the disk.  This may be useful if chainloading fails on certain hardware, but has the downside that the image must be regenerated for any change in the OS, bootloader or PXELinux templates.": [
        "Une variante des images par hôte qui contient le chargeur de démarrage de l'OS dans le disque. Cela peut être utile si le chainage échoue sur certains matériels, mais l'inconvénient est que l'image doit être régénérée à chaque changement du système,du chargeur de démarrage ou des modèles."
      ],
      "Action with sub plans": [
        "Action avec sous-plans"
      ],
      "All images are usable as either ISOs or as disk images, including being written to a USB disk with `dd`.": [
        "Toutes les images sont utilisables soit comme ISO soit comme images disque, y compris pour écriture sur disque USB avec 'dd'."
      ],
      "Allowed bootdisk types": [
        "Types de disques de démarrage autorisés"
      ],
      "Attach ISO image to CDROM drive for %s": [
        "Attachement de l'image ISO au lecteur CDROM pour %s"
      ],
      "Back": [
        "Précédent"
      ],
      "Boot disk": [
        "Disque de démarrage"
      ],
      "Boot disk Help": [
        "Aide sur le disque de démarrage"
      ],
      "Boot disk based": [
        "Basé sur le disque de démarrage"
      ],
      "Boot disk download not available for %s architecture": [
        "Téléchargement du disque de démarrage non disponible pour l'architecture %s"
      ],
      "Boot disk help": [
        "Aide sur le disque de démarrage"
      ],
      "Boot disks": [
        "Disques de démarrage"
      ],
      "Command to generate ISO image, use genisoimage or mkisofs": [
        "Commande servant à générer l'image ISO, utiliser genisoimage ou mkisofs"
      ],
      "Creating new image failed, install truncate utility": [
        "La création d'une nouvelle image a échoué, installer l'utilitaire de troncation"
      ],
      "Detach ISO image from CDROM drive for %s": [
        "Attachement de l'image ISO au lecteur CDROM pour %s"
      ],
      "Download generic image": [
        "Télécharger une image générique"
      ],
      "Download host image": [
        "Télécharger une image d'hôte"
      ],
      "Download subnet generic image": [
        "Télécharger une image générique du sous réseau"
      ],
      "Ensure %{file} is readable (or update \\\"Grub2 directory\\\" setting)": [
        "S'assurer que %{file} est lisible (ou mettre à jour le paramètre \\\"répertoire Grub2\\\")"
      ],
      "Failed to attach ISO image to CDROM drive of instance %{name}: %{message}": [
        "Impossible d'attacher l'image ISO au lecteur CDROM de l'instance %{name} : %{message}"
      ],
      "Failed to create a directory within the ESP image": [
        "Echec de la création d'un répertoire dans l'image ESP"
      ],
      "Failed to detach ISO image from CDROM drive of instance %{name}: %{message}": [
        "Impossible d'attacher l'image ISO au lecteur CDROM de l'instance %{name} : %{message}"
      ],
      "Failed to format the ESP image via mkfs.msdos": [
        "Le formatage de l'image ESP via mkfs.msdos a échoué"
      ],
      "Failed to generate ISO image for instance %{name}: %{message}": [
        "Impossible de créer l'image ISO pour l'instance %%{name} : %{message}"
      ],
      "Failed to render boot disk template": [
        "Impossible d'appliquer le modèle de disque de boot"
      ],
      "Failed to upload ISO image for instance %{name}: %{message}": [
        "Impossible d'envoyer l'image ISO pour l'instance %%{name} : %{message}"
      ],
      "Full host '%s' image": [
        "Image complète de l'hôte %s"
      ],
      "Full host image": [
        "Image complète de l'hôte"
      ],
      "Generating ISO image for %s": [
        "Création de l'image ISO pour %s"
      ],
      "Generic Grub2 EFI image template": [
        "Modèle d'image générique Grub2 EFI"
      ],
      "Generic image": [
        "Image générique"
      ],
      "Generic image template": [
        "Modèle d'image générique"
      ],
      "Generic images": [
        "Images génériques"
      ],
      "Generic images are a reusable disk image that works for any host registered in Foreman.  It requires a basic DHCP and DNS service to function and contact the server, but does not require DHCP reservations or static IP addresses.": [
        "Les images génériques correspondent à une image disque réutilisable qui fonctionne pour tout hôte enregistré dans Foreman. Cela demande les services DHCP et DNS fonctionnels mais ne requiert pas de réservation DHCP ni d'adresse IP statique."
      ],
      "Grub2 directory": [
        "Répertoire Grub2"
      ],
      "Host '%s' image": [
        "Image hôte %s"
      ],
      "Host image": [
        "Image hôte"
      ],
      "Host image template": [
        "Modèle d'image hôte"
      ],
      "Host images": [
        "Images hôte"
      ],
      "Host is not in build mode": [
        "L’hôte n’est pas en mode build"
      ],
      "Host is not in build mode, so the template cannot be rendered": [
        "L'hôte n'est pas en mode build, c'est pourquoi le modèle ne peut être rendu"
      ],
      "Host is not in build mode.": [
        "L’hôte n’est pas en mode build"
      ],
      "ISO build failed": [
        "La création de l'image ISO a échoué"
      ],
      "ISO generation command": [
        "Commande de génération ISO"
      ],
      "ISO hybrid conversion failed: %s": [
        "La conversion de l'image ISO hybride a échoué: %s"
      ],
      "ISOLINUX directory": [
        "Répertoire ISOLINUX"
      ],
      "Import Puppet classes": [
        "Importer des classes Puppet"
      ],
      "Import facts": [
        "Importer des faits"
      ],
      "Installation media caching": [
        "Mise en cache des médias d'installation"
      ],
      "Installation media files will be cached for full host images": [
        "Les fichiers du media d'installation vont être cachés pour les images complètes d'hôtes"
      ],
      "List of allowed bootdisk types, remove type to disable it": [
        "Liste des types de disques de démarrage autorisés, supprimer le type pour le désactiver"
      ],
      "Not available": [
        "Non disponible"
      ],
      "Once chainloaded, the OS bootloader and installer are downloaded directly from the installation media configured in Foreman, and the provisioning script (kickstart/preseed) is downloaded from Foreman.": [
        "Une fois liés, le chargeur de démarrage (bootloader) du système et l'installeur sont téléchargés directement depuis le media d'installation configuré dans Foreman. Le script de provisioning (kickstart/preseed) est également téléchargé depuis Foreman."
      ],
      "Path to directory containing grubx64.efi and shimx64.efi": [
        "Chemin d'accès au répertoire contenant grubx64.efi et shimx64.efi"
      ],
      "Path to directory containing iPXE images": [
        "Emplacement du répertoire contenant les images iPXE"
      ],
      "Path to directory containing isolinux images": [
        "Emplacement du répertoire contenant les images isolinux"
      ],
      "Path to directory containing syslinux images": [
        "Emplacement du répertoire contenant les images syslinux"
      ],
      "Per-host images contain data about a particular host registered in Foreman and set up fully static networking, avoiding the requirement for DHCP.  After networking is configured, they chainload from Foreman, picking up the current OS configuration and build state from the server.": [
        "Les images par hôte contiennent des données spécifiques pour un hôte donné enregistré dans Foreman et configurent de manière statique les paramètres réseau, ce qui permet de s'affranchir d'un serveur DHCP. Une fois le réseau configuré, ils sont liés depuis Foreman, récupérant la configuration du système d'exploitation et l'état de construction du serveur."
      ],
      "Please ensure the ipxe-bootimgs package is installed.": [
        "Veillez à ce que le paquetage ipxe-bootimgs soit installé."
      ],
      "Please ensure the isolinux/syslinux package(s) are installed.": [
        "Veillez à ce que le ou les paquetages isolinux/syslinux soient installés."
      ],
      "Plugin for Foreman that creates iPXE-based boot disks to provision hosts without the need for PXE infrastructure.": [
        "Plugin pour Foreman qui crée le démarrage des disques iPXE-bases pour provisionner les hôtes sans l'aide de l'infrastructure PXE."
      ],
      "Remote action:": [
        "Action distante :"
      ],
      "SYSLINUX directory": [
        "Répertoire SYSLINUX"
      ],
      "Subnet '%s' generic image": [
        "Image générique du sous-réseau %s"
      ],
      "Subnet boot disks": [
        "Sous-réseau des disques de démarrage"
      ],
      "Subnet generic image": [
        "Image générique du sous-réseau"
      ],
      "Subnet image": [
        "Image pour le sous-Réseau"
      ],
      "Subnet images are similar to generic images, but chain-loading is done via the TFTP Smart Proxy assigned to the Subnet of the host. The smart proxy must have the \\\"Templates\\\" module enabled and configured.": [
        "Les images pour sous-réseaux sont similaires aux images génériques, mais le chainage est fait par le smart proxy TFTP attribué au sous-réseau de l'hôte. Le smart proxy doit avoir le module \\\"modèles\\\" activé et configuré."
      ],
      "TFTP feature not enabled for subnet %s": [
        "La fonction TFTP n'est pas activée pour le sous-réseau %s"
      ],
      "The OS install continues using the installation media configured in Foreman, and it will typically configure static networking, depending on how the OS iPXE template is configured.": [
        "L'installation du système d'exploitation continue en utilisant le media d'installation configuré dans Foreman. Cela va généralement configurer le réseau selon la configuration du modèle iPXE du système d'exploitation."
      ],
      "These images are more generic than previous images. You can find them at subnet index page.": [
        "Ces images sont plus génériques que les images précédentes. Vous pouvez les trouver à la page d'index des sous-réseaux."
      ],
      "These images are used for host. You can find them at host detail page.": [
        "Ces images sont utilisées pour l'hôte. Vous pouvez les trouver sur la page de détail de l'hôte."
      ],
      "This image is generic for all hosts with a provisioning NIC on that subnet.": [
        "Cette image est générique pour tous les hôtes qui ont une interface réseau configurée en provisioning dans ce sous-réseau."
      ],
      "This type of bootdisk is not allowed. Please contact administrator.": [
        "Ce type de disque de démarrage n'est pas autorisé. Veuillez contacter l'administrateur."
      ],
      "True for full, false for basic reusable image": [
        "Vrai pour complète, faux pour une image basique réutilisable"
      ],
      "Unable to find template specified by %s setting": [
        "Impossible de trouver un modèle spécifié par le paramètre %s"
      ],
      "Unable to generate disk %{kind} template: %{error}": [
        "Impossible de générer le modèle %{kind} de disque : %{error}"
      ],
      "Unable to generate disk template, %{kind} template not found.": [
        "Impossible de générer le modèle de disque, le modèle %%{kind} est introuvable."
      ],
      "Unable to mcopy %{file}": [
        "Impossible de mcopier %{file}"
      ],
      "Upload ISO image to datastore for %s": [
        "Envoi de l'image ISO sur la banque de données pour %s"
      ],
      "Various types of boot disks can be created to provision hosts without the need for PXE services.  Boot disks can be attached to the host (physical or virtual) which boots from the disk, contacts Foreman and begins the OS installation.": [
        "Différents types de disque de démarrage peuvent être créés pour provisionner les hôtes sans requérir à PXE. Les disques de démarrage peuvent être attachés à un hôte (physique ou virtuel) qui démarre depuis le disque, contacte Foreman puis lance l'installation du système d'exploitation."
      ],
      "iPXE directory": [
        "Répertoire iPXE"
      ],
      "iPXE template to use for generic EFI host boot disks": [
        ""
      ],
      "iPXE template to use for generic host boot disks": [
        "Modèle iPXE à appliquer pour les disques de boot génériques"
      ],
      "iPXE template to use for host-specific boot disks": [
        "Le modèle iPXE à appliquer pour des disques de boot spécifiques à l'hôte"
      ]
    }
  }
};