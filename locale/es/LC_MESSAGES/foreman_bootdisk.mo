��    (      \  5   �      p    q  h   v     �  	   �  
   �  j   �  9   d     �     �  '   �     �            �   $     	               =     X  
   s  =   ~     �     �  <   �  �   '  (   �  ,   	    F	  D   _
  q   �
  "     -   9  �   g  -     /   J  $   z  �   �  0   �  1   �  �  �  #  �  y   �     6     =     O  �   b  >   �     *     E  =   ^     �     �     �    �     �     �  '     !   -      O     p  J   �  !   �  (   �  ]     �   t  2   G  6   z    �  J   �  p     (   �  6   �  �   �  ?   �  ]   �  ,   5    b  A   e  D   �                  
                      !                           $                                  &              "                     (   %         '   	                     #    A variant of the per-host image which contains the OS bootloader embedded inside the disk.  This may be useful if chainloading fails on certain hardware, but has the downside that the image must be regenerated for any change in the OS, bootloader or templates. All images are usable as either ISOs or as disk images, including being written to a USB disk with `dd`. Back Boot disk Boot disks Bootdisk is not supported with safemode rendering, please disable safemode_render under Adminster>Settings Command to generate ISO image, use genisoimage or mkisofs Download generic image Download host image Failed to render boot disk template: %s Full host '%s' image Full host image Generic image Generic images are a reusable disk image that works for any host registered in Foreman.  It requires a basic DHCP and DNS service to function and contact the server, but does not require DHCP reservations or static IP addresses. Help Host '%s' image Host has no IP address defined Host has no domain defined Host has no subnet defined Host image Host is not in build mode, so the template cannot be rendered ISO build failed ISO hybrid conversion failed Installation media files will be cached for full host images Once chainloaded, the OS bootloader and installer are downloaded directly from the installation media configured in Foreman, and the provisioning script (kickstart/preseed) is downloaded from Foreman. Path to directory containing iPXE images Path to directory containing syslinux images Per-host images contain data about a particular host registered in Foreman and set up fully static networking, avoiding the requirement for DHCP.  After networking is configured, they chainload from Foreman, picking up the current OS configuration and build state from the server. Please ensure the ipxe-bootimgs and syslinux packages are installed. Plugin for Foreman that creates iPXE-based boot disks to provision hosts without the need for PXE infrastructure. Subnet (%s) has no gateway defined Subnet (%s) has no primary DNS server defined The OS install continues using the installation media configured in Foreman, and it will typically configure static networking, depending on how the OS iPXE template is configured. True for full, false for basic reusable image Unable to find template specified by %s setting Unable to generate disk template: %s Various types of boot disks can be created to provision hosts without the need for PXE services.  Boot disks can be attached to the host (physical or virtual) which boots from the disk, contacts Foreman and begins the OS installation. iPXE template to use for generic host boot disks iPXE template to use for host-specific boot disks Project-Id-Version: foreman_bootdisk 4.0.2
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2015-02-20 11:19+0000
PO-Revision-Date: 2015-02-20 11:24+0000
Last-Translator: Dominic Cleal <dcleal@redhat.com>
Language-Team: Spanish (http://www.transifex.com/projects/p/foreman/language/es/)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Language: es
Plural-Forms: nplurals=2; plural=(n != 1);
 Una variante de la imagen por host que contiene el bootloader del SO embebido en el disco. Esto puede ser útil si la carga en cadena falla en un hardware determinado, pero tiene la desventaja de que se debe regenerar la imagen para cualquier cambio en el SO, el bootloader o las plantillas. Todas las imágenes pueden utilizarse como ISO o como imágenes de disco, incluso tras copiarlas en un disco USB con `dd` Atrás Disco de arranque Discos de arranque No se soporta un disco de arranque en el modo seguro de representación, deshabilite safemode_render bajo Administración>Configuración Comando para generar una imagen ISO, use genisoimage o mkisofs Descargar imagen genérica Descargar imagen de host Fallo en la entrega de la plantilla del disco de arranque: %s Imagen completa de host '%s' Imagen completa de host Imagen genérica Las imágenes genéricas son imágenes de disco reutilizables que funcionan con cualquier host registrado en Foreman. Requiere un servicio básico DCHP y DNS para funcionar y comunicarse con el servidor, pero no necesita reservas DHCP o direcciones IP estáticas. Ayuda Imagen del host '%s' El host no tiene dirección IP definida El host no tiene dominio definido El host no tiene subred definida Imágen de host El host no está en modo build, así que no se puede producir la plantilla Error en la construcción del ISO Error en la conversión del ISO Híbrido Archivos de medios de instalación se almacenarán en caché para imágenes completas de host Una vez encadenado, el bootloader del SO y el instalador se descargan directamente desde el medio de instalación configurado en Formena, y el script de provisión (kickstart/preseed) se descarga desde Foreman. Ruta al directorio que contiene las imágenes iPXE Ruta al directorio que contiene las imágenes syslinux Las imágenes por-host contienen datos sobre un host en particular registrado en Foreman y configuran una red completamente estática, sin necesidad de DHCP. Tras configurar la red, encadenan desde Foreman, cogiendo la configuración actual de SO y el estado de build del servidor. Asegúrese de que los paquetes ipxe-bootimgs y syslinux están instalados. Plugin para Foreman que crea discos de arranque iPXE para provisionar hosts sin necesidad de infraestructura PXE La subred (%s) no tiene gateway definida La subred (%s) no tiene servidor DNS primario definido La instalación del SO sigue usando el medio de instalación configurado en Foreman, y típicamente configura red estática, según como se configura la plantilla iPXE del SO. Verdadero para completo, falso para imagen básica reutilizable No ha sido posible encontrar la plantilla especificada por el parámetro de configuración %s No se pudo generar la plantilla de disco: %s Se puede crear varios tipos de discos de arranque para provisionar hosts sin necesidad de servicios PXE. Los discos de arranque pueden engancharse al host (físico o virtual) que arranca desde el disco, se conecta a Foreman y comienza la instalación del SO. Plantilla iPXE para usar en discos de arranque de host genéricos Plantilla iPXE para usar en discos de arranque de hosts particulares 