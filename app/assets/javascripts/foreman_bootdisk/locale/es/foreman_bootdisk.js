 locales['foreman_bootdisk'] = locales['foreman_bootdisk'] || {}; locales['foreman_bootdisk']['es'] = {
  "domain": "foreman_bootdisk",
  "locale_data": {
    "foreman_bootdisk": {
      "": {
        "Project-Id-Version": "foreman_bootdisk 21.0.4",
        "Report-Msgid-Bugs-To": "",
        "PO-Revision-Date": "2014-02-13 12:12+0000",
        "Last-Translator": "Sergio Ocón-Cárdenas <sergio.ocon@redhat.com>, 2014",
        "Language-Team": "Spanish (http://app.transifex.com/foreman/foreman/language/es/)",
        "MIME-Version": "1.0",
        "Content-Type": "text/plain; charset=UTF-8",
        "Content-Transfer-Encoding": "8bit",
        "Language": "es",
        "Plural-Forms": "nplurals=3; plural=n == 1 ? 0 : n != 0 && n % 1000000 == 0 ? 1 : 2;",
        "lang": "es",
        "domain": "foreman_bootdisk",
        "plural_forms": "nplurals=3; plural=n == 1 ? 0 : n != 0 && n % 1000000 == 0 ? 1 : 2;"
      },
      "* - These bootdisk types were disabled, you can enable them in Administer - Settings.": [
        "* - Estos tipos de discos de arranque estaban desactivados, puede activarlos en Administrar - Configuración."
      ],
      "A variant of the per-host image which contains the OS bootloader embedded inside the disk.  This may be useful if chainloading fails on certain hardware, but has the downside that the image must be regenerated for any change in the OS, bootloader or PXELinux templates.": [
        "Una variante de la imagen por host que contiene el cargador de arranque del sistema operativo incluido en el disco. Esto puede resultar útil si se produce un error en el hardware de la cadena de arranque. No obstante, tiene la particularidad de que la imagen debe regenerarse para cualquier cambio que se produzca en el sistema operativo, en el cargador de arranque o en las plantillas PXELinux."
      ],
      "Action with sub plans": [
        "Acción con subplanes"
      ],
      "All images are usable as either ISOs or as disk images, including being written to a USB disk with `dd`.": [
        "Todas las imágenes pueden utilizarse como ISO o como imágenes de disco, incluso tras copiarlas en un disco USB con `dd`"
      ],
      "Allowed bootdisk types": [
        "Tipos de discos de arranque permitidos"
      ],
      "Attach ISO image to CDROM drive for %s": [
        "Adjuntar la imagen ISO a la unidad de CDROM para %s"
      ],
      "Back": [
        "Atrás"
      ],
      "Boot disk": [
        "Disco de arranque"
      ],
      "Boot disk Help": [
        "Ayuda para el disco de arranque"
      ],
      "Boot disk based": [
        "Basado en el disco de arranque"
      ],
      "Boot disk download not available for %s architecture": [
        "La descarga del disco de arranque no está disponible para la arquitectura %s "
      ],
      "Boot disk help": [
        "Ayuda para el disco de arranque"
      ],
      "Boot disks": [
        "Discos de arranque"
      ],
      "Command to generate ISO image, use genisoimage or mkisofs": [
        "Comando para generar una imagen ISO, use genisoimage o mkisofs"
      ],
      "Creating new image failed, install truncate utility": [
        "Error en la creación de la nueva imagen; instale la herramienta para truncar"
      ],
      "Detach ISO image from CDROM drive for %s": [
        "Extraer la imagen ISO de la unidad de CDROM para %s"
      ],
      "Download generic image": [
        "Descargar imagen genérica"
      ],
      "Download host image": [
        "Descargar imagen de host"
      ],
      "Download subnet generic image": [
        "Descargar imagen genérica de la subred"
      ],
      "Ensure %{file} is readable (or update \\\"Grub2 directory\\\" setting)": [
        "Asegúrese de que %{file} es legible (o actualice la configuración del \\\"directorio Grub2\\\")"
      ],
      "Failed to attach ISO image to CDROM drive of instance %{name}: %{message}": [
        "Fallo al adjuntar la imagen ISO a la unidad de CDROM de la instancia %{name}: %{message}"
      ],
      "Failed to create a directory within the ESP image": [
        "Ocurrió un error al crear un directorio dentro de la imagen ESP"
      ],
      "Failed to detach ISO image from CDROM drive of instance %{name}: %{message}": [
        "Fallo al separar la imagen ISO de la unidad de CDROM de la instancia %{name}: %{message}"
      ],
      "Failed to format the ESP image via mkfs.msdos": [
        "Ocurrió un error al formatear la imagen ESP a través de mkfs.msdos"
      ],
      "Failed to generate ISO image for instance %{name}: %{message}": [
        "Fallo al generar la imagen ISO para el ejemplo %{name}: %{message}"
      ],
      "Failed to render boot disk template": [
        "Ocurrió un error al mostrar la plantilla del disco de arranque"
      ],
      "Failed to upload ISO image for instance %{name}: %{message}": [
        "Fallo en la carga de la imagen ISO por ejemplo %{name}: %{message}"
      ],
      "Full host '%s' image": [
        "Imagen completa del host '%s'"
      ],
      "Full host image": [
        "Imagen completa de host"
      ],
      "Generating ISO image for %s": [
        "Generación de la imagen ISO para %s"
      ],
      "Generic Grub2 EFI image template": [
        "Plantilla de imagen EFI genérica de Grub2"
      ],
      "Generic image": [
        "Imagen genérica"
      ],
      "Generic image template": [
        "Plantilla de imagen genérica"
      ],
      "Generic images": [
        "Imágenes genéricas"
      ],
      "Generic images are a reusable disk image that works for any host registered in Foreman.  It requires a basic DHCP and DNS service to function and contact the server, but does not require DHCP reservations or static IP addresses.": [
        "Las imágenes genéricas son imágenes de disco reutilizables que funcionan con cualquier host registrado en Foreman. Requiere un servicio básico DCHP y DNS para funcionar y comunicarse con el servidor, pero no necesita reservas DHCP o direcciones IP estáticas."
      ],
      "Grub2 directory": [
        "Directorio Grub2"
      ],
      "Host '%s' image": [
        "Anfitrión '%s' imagen"
      ],
      "Host image": [
        "Imágen de host"
      ],
      "Host image template": [
        "Plantilla de imagen de host"
      ],
      "Host images": [
        "Imágenes del anfitrión"
      ],
      "Host is not in build mode": [
        "El host no está en modo de construcción"
      ],
      "Host is not in build mode, so the template cannot be rendered": [
        "El host no está en modo build, así que no se puede producir la plantilla"
      ],
      "Host is not in build mode.": [
        "El host no está en modo de construcción."
      ],
      "ISO build failed": [
        "Error en la construcción del ISO"
      ],
      "ISO generation command": [
        "Comando de generación ISO"
      ],
      "ISO hybrid conversion failed: %s": [
        "La conversión híbrida ISO ha fallado: %s"
      ],
      "ISOLINUX directory": [
        "Directorio ISOLINUX"
      ],
      "Import Puppet classes": [
        "Importar clases Puppet"
      ],
      "Import facts": [
        "Importar datos"
      ],
      "Installation media caching": [
        "Habilitando caché de medios de instalación"
      ],
      "Installation media files will be cached for full host images": [
        "Archivos de medios de instalación se almacenarán en caché para imágenes completas de host"
      ],
      "List of allowed bootdisk types, remove type to disable it": [
        "Lista de tipos de discos de arranque permitidos, elimine el tipo para desactivarlo"
      ],
      "Not available": [
        "No disponible"
      ],
      "Once chainloaded, the OS bootloader and installer are downloaded directly from the installation media configured in Foreman, and the provisioning script (kickstart/preseed) is downloaded from Foreman.": [
        "Una vez encadenado, el bootloader del SO y el instalador se descargan directamente desde el medio de instalación configurado en Formena, y el script de provisión (kickstart/preseed) se descarga desde Foreman."
      ],
      "Path to directory containing grubx64.efi and shimx64.efi": [
        "Ruta de acceso al directorio que contiene grubx64.efi y shimx64.efi"
      ],
      "Path to directory containing iPXE images": [
        "Ruta al directorio que contiene las imágenes iPXE"
      ],
      "Path to directory containing isolinux images": [
        "Ruta al directorio que contiene imágenes isolinux"
      ],
      "Path to directory containing syslinux images": [
        "Ruta al directorio que contiene las imágenes syslinux"
      ],
      "Per-host images contain data about a particular host registered in Foreman and set up fully static networking, avoiding the requirement for DHCP.  After networking is configured, they chainload from Foreman, picking up the current OS configuration and build state from the server.": [
        "Las imágenes por-host contienen datos sobre un host en particular registrado en Foreman y configuran una red completamente estática, sin necesidad de DHCP. Tras configurar la red, encadenan desde Foreman, cogiendo la configuración actual de SO y el estado de build del servidor."
      ],
      "Please ensure the ipxe-bootimgs package is installed.": [
        "Asegúrese de que el paquete ipxe-bootimgs esté instalado."
      ],
      "Please ensure the isolinux/syslinux package(s) are installed.": [
        "Asegúrese de que el(los) paquete(s) isolinux/syslinux estén instalados."
      ],
      "Plugin for Foreman that creates iPXE-based boot disks to provision hosts without the need for PXE infrastructure.": [
        "Plugin para Foreman que crea discos de arranque iPXE para provisionar hosts sin necesidad de infraestructura PXE"
      ],
      "Remote action:": [
        "Acción remota:"
      ],
      "SYSLINUX directory": [
        "Directorio SYSLINUX"
      ],
      "Subnet '%s' generic image": [
        "Subnet '%s' imagen genérica"
      ],
      "Subnet boot disks": [
        "Discos de arranque de la subred"
      ],
      "Subnet generic image": [
        "Imagen genérica de la subred"
      ],
      "Subnet image": [
        "Imagen de la subred"
      ],
      "Subnet images are similar to generic images, but chain-loading is done via the TFTP Smart Proxy assigned to the Subnet of the host. The smart proxy must have the \\\"Templates\\\" module enabled and configured.": [
        "Las  imágenes de la subred son similares a imágenes genéricas. No obstante, la carga de la cadena se lleva a cabo a través del proxy inteligente TFTP asignado a la subred del host. El proxy inteligente debe tener el módulo \\\"Plantillas\\\" habilitado y configurado."
      ],
      "TFTP feature not enabled for subnet %s": [
        "La función TFTP no está habilitada para la subred %s"
      ],
      "The OS install continues using the installation media configured in Foreman, and it will typically configure static networking, depending on how the OS iPXE template is configured.": [
        "La instalación del SO sigue usando el medio de instalación configurado en Foreman, y típicamente configura red estática, según como se configura la plantilla iPXE del SO."
      ],
      "These images are more generic than previous images. You can find them at subnet index page.": [
        "Estas imágenes son más genéricas que las anteriores. Puede encontrarlas en la página del índice de subredes."
      ],
      "These images are used for host. You can find them at host detail page.": [
        "Estas imágenes se utilizan para el anfitrión. Puede encontrarlas en la página de detalles del anfitrión."
      ],
      "This image is generic for all hosts with a provisioning NIC on that subnet.": [
        "Esta imagen es genérica para todos los hosts con un NIC de aprovisionamiento en dicha subred."
      ],
      "This type of bootdisk is not allowed. Please contact administrator.": [
        "Este tipo de disco de arranque no está permitido. Por favor, póngase en contacto con el administrador."
      ],
      "True for full, false for basic reusable image": [
        "Verdadero para completo, falso para imagen básica reutilizable"
      ],
      "Unable to find template specified by %s setting": [
        "No se puede encontrar la plantilla especificada en %s "
      ],
      "Unable to generate disk %{kind} template: %{error}": [
        "No se ha podido generar el disco %{kind} plantilla: %{error}"
      ],
      "Unable to generate disk template, %{kind} template not found.": [
        "No se ha podido generar la plantilla de disco, %{kind} plantilla no encontrada."
      ],
      "Unable to mcopy %{file}": [
        "No se puede mcopiar %{file}"
      ],
      "Upload ISO image to datastore for %s": [
        "Subir la imagen ISO al datastore para %s"
      ],
      "Various types of boot disks can be created to provision hosts without the need for PXE services.  Boot disks can be attached to the host (physical or virtual) which boots from the disk, contacts Foreman and begins the OS installation.": [
        "Se puede crear varios tipos de discos de arranque para provisionar hosts sin necesidad de servicios PXE. Los discos de arranque pueden engancharse al host (físico o virtual) que arranca desde el disco, se conecta a Foreman y comienza la instalación del SO."
      ],
      "iPXE directory": [
        "Directorio iPXE"
      ],
      "iPXE template to use for generic EFI host boot disks": [
        ""
      ],
      "iPXE template to use for generic host boot disks": [
        "Plantilla iPXE para usar en discos de arranque de host genéricos"
      ],
      "iPXE template to use for host-specific boot disks": [
        "Plantilla iPXE para usar en discos de arranque de hosts particulares"
      ]
    }
  }
};