Ţ    S      ´  q   L        U       g  h   u     Ţ  &   ő     	  	   !	     +	     :	  4   J	     	  
   	  9   	  3   Ó	  (   
     0
     G
     [
  @   y
  I   ş
  1     K   6  -     =   °  #   î  ;        N     c     s           °     ž     Ő  ä   ä     É     Ů  
   é     ô            =   .     l                Ż     Đ     ă  <   ţ  9   ;     u  Č     8   L  (     ,   Ž  ,   Ű      5   !  =   W  q                  4     F     [  Ě   h  &   5  ´   \  [     F   m  K   ´  C      -   D  /   r  2   ˘  =   Ő       $   +  ę   P     ;  4   J  0     1   °  v  â    Y  ř  [  î   T  c   C  X   §         1      P   ?   S      Ş   ä   P   !  7   ŕ!  ^   "     w"  i   ˙"  >   i#  >   ¨#  l   ç#  š   T$  p   %  ^   %  y   Ţ%  Z   X&  f   ł&  |   '  l   '  5   (  /   :(  B   j(  B   ­(     đ(  8   )     I)  ś  i)  !    ,  "   B,     e,  8   ,  %   ž,  H   ä,  §   --  I   Ő-  3   .  B   S.  b   .  $   ů.  D   /  ¨   c/  Č   0  -   Ő0  Ü  1     ŕ2  o   l3  s   Ü3  s   P4  )  Ä4  m   î7  }   \8  N  Ú8  $   ):  ]   N:  M   Ź:  ;   ú:  (   6;    _;  R   ~=  Ř  Ń=  ü   Ş?  Ú   §@  ě   A  Ž   oB  }   C     C  q   (D  Ł   D  7   >E  U   vE  Ź  ĚE      yH  ˇ   H  ˘   RI  ˛   őI         F          /      4      &   6                         I   
       B   3   H         <   -          E   S   O          7   *       8   A            @                             +         0   '   ;   	          Q      )            M   $               =   1      ?       #              C       !   5   (   G   9   .                     ,   R   >      N   L   K   %                      2      :   "       D   P   J    * - These bootdisk types were disabled, you can enable them in Administer - Settings. A variant of the per-host image which contains the OS bootloader embedded inside the disk.  This may be useful if chainloading fails on certain hardware, but has the downside that the image must be regenerated for any change in the OS, bootloader or PXELinux templates. All images are usable as either ISOs or as disk images, including being written to a USB disk with `dd`. Allowed bootdisk types Attach ISO image to CDROM drive for %s Back Boot disk Boot disk Help Boot disk based Boot disk download not available for %s architecture Boot disk help Boot disks Command to generate ISO image, use genisoimage or mkisofs Creating new image failed, install truncate utility Detach ISO image from CDROM drive for %s Download generic image Download host image Download subnet generic image Ensure %{file} is readable (or update "Grub2 directory" setting) Failed to attach ISO image to CDROM drive of instance %{name}: %{message} Failed to create a directory within the ESP image Failed to detach ISO image from CDROM drive of instance %{name}: %{message} Failed to format the ESP image via mkfs.msdos Failed to generate ISO image for instance %{name}: %{message} Failed to render boot disk template Failed to upload ISO image for instance %{name}: %{message} Full host '%s' image Full host image Generating ISO image for %s Generic Grub2 EFI image template Generic image Generic image template Generic images Generic images are a reusable disk image that works for any host registered in Foreman.  It requires a basic DHCP and DNS service to function and contact the server, but does not require DHCP reservations or static IP addresses. Grub2 directory Host '%s' image Host image Host image template Host images Host is not in build mode Host is not in build mode, so the template cannot be rendered Host is not in build mode. ISO build failed ISO generation command ISO hybrid conversion failed: %s ISOLINUX directory Installation media caching Installation media files will be cached for full host images List of allowed bootdisk types, remove type to disable it Not available Once chainloaded, the OS bootloader and installer are downloaded directly from the installation media configured in Foreman, and the provisioning script (kickstart/preseed) is downloaded from Foreman. Path to directory containing grubx64.efi and shimx64.efi Path to directory containing iPXE images Path to directory containing isolinux images Path to directory containing syslinux images Per-host images contain data about a particular host registered in Foreman and set up fully static networking, avoiding the requirement for DHCP.  After networking is configured, they chainload from Foreman, picking up the current OS configuration and build state from the server. Please ensure the ipxe-bootimgs package is installed. Please ensure the isolinux/syslinux package(s) are installed. Plugin for Foreman that creates iPXE-based boot disks to provision hosts without the need for PXE infrastructure. SYSLINUX directory Subnet '%s' generic image Subnet boot disks Subnet generic image Subnet image Subnet images are similar to generic images, but chain-loading is done via the TFTP Smart Proxy assigned to the Subnet of the host. The smart proxy must have the "Templates" module enabled and configured. TFTP feature not enabled for subnet %s The OS install continues using the installation media configured in Foreman, and it will typically configure static networking, depending on how the OS iPXE template is configured. These images are more generic than previous images. You can find them at subnet index page. These images are used for host. You can find them at host detail page. This image is generic for all hosts with a provisioning NIC on that subnet. This type of bootdisk is not allowed. Please contact administrator. True for full, false for basic reusable image Unable to find template specified by %s setting Unable to generate disk %{kind} template: %{error} Unable to generate disk template, %{kind} template not found. Unable to mcopy %{file} Upload ISO image to datastore for %s Various types of boot disks can be created to provision hosts without the need for PXE services.  Boot disks can be attached to the host (physical or virtual) which boots from the disk, contacts Foreman and begins the OS installation. iPXE directory iPXE template to use for generic EFI host boot disks iPXE template to use for generic host boot disks iPXE template to use for host-specific boot disks Project-Id-Version: foreman_bootdisk 22.0.0
Report-Msgid-Bugs-To: 
PO-Revision-Date: 2014-02-13 12:12+0000
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language-Team: Georgian (http://app.transifex.com/foreman/foreman/language/ka/)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Language: ka
Plural-Forms: nplurals=2; plural=(n!=1);
 * - ááĄ áŠáá˘ááá ááááá áááĄáááĄ ááĄ á˘ááááá ááááá¨áŁááá. áááá áŠáá ááááĄááááĄ ááááááá "áááááááĄá˘á áá ááá - ááá áááá". áááá á°ááĄá˘ááĄ ááĄáááĄ ááá áááá˘á, á ááááááŞ á¨áááŞáááĄ áááĄááá áŠáá¨áááááŁá OS-ááĄ áŠááá˘ááá áááááĄ. ááĄ á¨áááŤáááá áá§ááĄ áĄááĄáá ááááá, ááŁ áĄááŹá§ááĄá áŠáá˘ááá ááá ááá  áŽáá áŽáááá ááá ááááŁá áááá áá˘áŁá ááá, áááá áá ááĽááĄ áŁáá á§áá¤ááá ááŽáá á, á áá ááĄáá OS, bootloader áá PXELinux á¨áááááááááĄ áááááĄáááá á áŞááááááááĄááĄ ááááááá áŁááá áá§ááĄ á áááááá áá áááŁáá. á§áááá ááĄáá ááááá§áááááááá, á áááá áŞ ISO áá á áááá áŞ áááĄáááĄ ááĄáá. ááá á¨áá ááĄ áŠááŹáá ááá USB áááĄááá `dd`-áá. áŠáá˘ááá ááááá áááĄáááĄ ááá¨ááááŁáá á˘ááááá %s-áĄááááĄ ISO ááĄáááĄ CDROM áŹááá§ááááá ááááá áŁááá áŠáá˘ááá ááááá áááĄáá áŠáá˘ááá ááááá áááĄáááĄ áááŽááá ááá áŠáá˘ááá ááááá áááĄáá ááááá áááŁááá áŠáá˘ááá ááááá áááĄáááĄ ááááááŹáá á áááŁáŹáááááááá áá áĽáá˘ááĽá˘áŁá ááĄááááĄ: %s áŠáá˘ááá ááááá áááĄáááĄ áááŽááá ááá áŠáá˘ááá ááááá áááĄáááá ISO ááĄáááĄ á¨ááĽááááĄ áá áŤááááá. genisoimage áá mkisofs ááŽááá ááĄáááĄ á¨ááĽááááĄ á¨ááŞáááá. áááá§áááá áá ááá ááá truncate %s-áĄááááĄ ISO-á ááĄáááĄ CDROM-á áŹááá§ááááááá áááŽáĄáá áááááá ááĄáááĄ ááááááŹáá á á°ááĄá˘ááĄ ááĄáááĄ ááááááŹáá á áĽáááĽáĄááááĄ áŠáá˘ááá ááááá áááĄáááĄ ááááááŹáá á ááá áŹááŁáááá, á áá %{file} ááááŽááááá (áá ááááááŽááá ááá áááá˘á á "Grub2-ááĄ áĄááĽááŚáááá") ISO ááĄáááĄ CDROM-á¨á áŠááááááĄ á¨ááŞáááá %{name}-áĄááááĄ: %{message} ESP ááĄáá¨á áĄááĽááŚáááááĄ á¨ááĽááááĄ á¨ááŞáááá ISO ááĄáááĄ CDROM-ááá áááááŚááááĄ á¨ááŞáááá %{name}-áĄááááĄ: %{message} ESP ááĄáááĄ mkfs.msdos-áá ááá¤áá ááá˘ááááĄ á¨ááŞáá ISO á¤áááááĄ á¨ááĽááááĄ á¨ááŞáááá %{name}-áĄááááĄ: %{message} áŠáá˘ááá ááááá áááĄáááĄ á¨áááááááĄ á ááááá ááĄ á¨ááŞáááá ISO á¤áááááĄ áá˘ááá ááááĄ á¨ááŞáááá %{name}-áĄááááĄ: %{message} á°ááĄá˘áĄááĄ áĄá áŁáá %s ááĄáá á°ááĄá˘ááĄ áĄá áŁáá ááĄáá %s-áĄááááĄ ISO ááĄáááĄ ááááá ááŞáá Grub2 EFI áááááá ááĄáááĄ á¨áááááá áááááá ááĄáá áááááá ááĄáááĄ á¨áááááá áááááá ááĄáá áááááá ááĄáááá áŹáá ááááááááá áááĄáááĄ áá áááááŻáá áá ááĄááĄ, á ááááááŞ ááŁá¨ááááĄ Foreman-á¨á á ááááĄá˘á áá áááŁáá áááááĄáááá á á°ááĄá˘ááĄááááĄ. áááĄ á¤áŁááĽáŞááááá ááááĄááááĄ áŁáá ááá DHCP áá DNS áĄáá áááĄááá áĄá­áá áááá áĄáá ááá ááá áááĄááááá¨áá ááááá, áááá áá áá  áĄáá­áá ááááĄ DHCP áááŻááá¨áááĄ áá áĄá˘áá˘áááŁá á IP áááĄáááá ááááĄ. Grub2 áĄááĽááŚáááá á°ááĄá˘ááĄ %s ááĄáá á°ááĄá˘ááĄ ááĄáá á°ááĄá˘ááĄ ááĄáááĄ á¨áááááá á°ááĄá˘ááĄ ááĄáááá á°ááĄá˘ááĄ ááááááĄ á ááááá¨á áá áá á°ááĄá˘á áááááĄ á ááááá¨á áá áá, áááá˘áá á¨áááááááĄ á ááááá á á¨ááŁáŤááááááá á°ááĄá˘ááĄ ááááááĄ á ááááá¨á áá áá. ISO-ááĄ ááááááĄ á¨ááŞáááá ISO-ááĄ ááááá ááŞáááĄ áá áŤááááá ISO-ááĄ á°ááá áááŁáá ááá áááĽááááĄ áá áááááá: %s ISOLINUX áĄááĽááŚáááá áááĄáá§ááááááá áááĄáááĄ ááá¨á áááĄá˘ááááŞáááĄ á¤áááááá áááĽáá¨ááá ááĽáááá á°ááĄá˘ááĄ áĄá áŁáá ááĄáááááĄááááĄ áŠáá˘ááá ááááá áááĄáááááĄ ááááááá ááŁáá á˘ááááá. áááááĄáá ááááá áŁáá áááá áŹáá¨áááá ááĄ áŽáááááŁáŹáááááááá áĄááŹá§ááĄá áŠáá˘ááá ááááĄ á¨ááááá, OS-ááĄ áŠááá˘ááá ááááá áá áááĄá˘áááá á áŠááááá˘ááá áááá áŁá¨áŁáááá Foreman-á¨á ááá ááááŁáá áĄááááĄá˘ááááŞáá áááááááá, áŽááá áŁáá áŁááááá§áá¤ááĄ áĄáá ááá˘á (kickstart/preseed) áŠááááá˘ááá áááá Foreman-ááá. áááááá grubx64.efi-ááĄáá shimx64.efi á¤áááááááĄ á¨áááŞááá áĄááĽááŚááááááá áááááá iPXE-ááĄ ááĄáááááĄ á¨áááŞááá áĄááĽááŚááááááá áááááá isolinux-ááĄ ááĄáááááĄ á¨áááŞááá áĄááĽááŚááááááá áááááá syslinux-ááĄ ááĄáááááĄ á¨áááŞááá áĄááĽááŚááááááá áááááŁáá á°ááĄá˘ááĄ ááĄáá á¨áááŞáááĄ áááááŞáááááĄ ááááá áá˘áŁáá á°ááĄá˘ááĄ á¨ááĄááŽáá, á ááááááŞ á ááááĄá˘á áá áááŁááá Foreman-á¨á áá ááá§áááááŁááá áĄá áŁááá áĄá˘áá˘áááŁá á áĽáĄááááĄ ááá áááá˘á ááá, DHCP-ááĄ ááááááá ááĄááŞááááááá.   áĽáĄááááĄ áááá¤áááŁá ááŞáááĄ á¨ááááá, ááĄááá áá˘ááá áááá Foreman-ááá, ááŚáááá OS-ááĄ áááááááá á áááá¤áááŁá ááŞáááĄ áá áĽááááá ááááááá áááááĄ áĄáá ááá áááá. ááá áŹááŁáááá, á áá ipxe-bootimgs ááááá˘á ááá§áááááŁááá. ááá áŹááŁáááá, á áá isolnux/syslinux-ááĄ ááááá˘ááá ááá§áááááŁááá. Foreman-ááĄ ááááá˘ááá, á ááááááŞ áĽááááĄ iPXE-áá ááá¤áŁáŤááááŁá áŠáá˘ááá áááá áááĄááááĄ á°ááĄá˘ááááĄ áĄáááŁá¨ááá PXE ááá¤á ááĄá˘á áŁáĽá˘áŁá ááĄ ááá áá¨á áááĄáááááááááá. SYSLINUX áĄááĽááŚáááá áĽáááĽáĄááááĄ %s áááááá ááĄáááĄ ááááááŹáá á áĽáááĽáĄááááĄ áŠáá˘ááá ááááá áááĄáá áĽáááĽáĄááááĄ áááááá ááĄáá áĽáááĽáĄááááĄ ááĄáá áĽáááĽáĄááááĄ ááĄáááá ááĄááááĄáá áááááá ááĄáááááĄ, áááá áá áĄááŹá§ááĄá áŠáá˘ááá ááá áŽáááá TFTP Smart Proxy-ááĄ ááá¨áááááá, á ááááááŞ ááááá­áááŁááá á°ááĄá˘ááĄ áĽáááĽáĄáááá. á­ááááá áá ááĽáĄááĄ áŁááá á°áĽáááááĄ áŠáá ááŁáá áá ááá ááááŁáá ááááŁáá âá¨ááááááááâ. áĽáááĽáĄááááĄááááĄ %s TFTP áŠáá ááŁáá áá áá ááĄ-ááĄ ááá§ááááá áá áŤáááááá Foreman-á¨á ááá ááááŁáá áááĄáá§ááááááá ááááááĄ ááááá§áááááá áá ááĄ áŠáááŁáááá áá ááááá¤áááŁá áá áááĄ áĄá˘áá˘áááŁá á áĽáĄáááĄ, ááááĄáá áááŽááááá, ááŁ á áááá  áá ááĄ ááá ááááŁáá OS iPXE á¨áááááá. ááĄ ááĄáááá áŁá¤á á ááááááá, áááá á áŤáááá ááĄáááá. ááĄááá áĽáááĽáĄááááĄ áááááĽáĄááĄ áááá ááá á¨ááááŤáááá áááááá. ááĄ ááĄáááá á°ááĄá˘ááĄááááĄ áááááá§ááááá. áááá ááááá á°ááĄá˘ááĄ ááá˘ááááááĄ áááá ááá á¨ááááŤáááá. ááĄ ááĄáá áĄááá ááá áá áĽáááĽáĄááááĄ á§áááá áĄáááŁá¨ááá ááááááááááĄ ááá˘áá á¤áááĄááĄ ááĽááá á°ááĄá˘ááááĄááááĄ. áŠáá˘ááá ááááá áááĄáá ááŽáá áááŁá­áá áááá. áááŁáááá¨áá ááá áááááááĄá˘á áá˘áá áĄ. áŠáá ááá áĄá áŁáá, ááááá ááá áá áááááŻáá ááá ááĄáááĄááááĄ %s ááá áááá˘á áá ááááááááŁáá á¨áááááááĄ ááááá á¨ááŁáŤááááááá áááĄáááĄ %{kind} á¨áááááááĄ %{error} ááááá ááŞáááĄ á¨ááŞáááá áááĄáááĄ á¨áááááááĄ ááááá ááŞáááĄ áá áááááá. á¨áááááá %{kind} áá  áá áĄáááááĄ. %{file}-ááĄ mcropy á¨ááŁáŤááááááá %s-áĄááááĄ ISO ááĄáááĄ áĄááŞáááá áá˘ááá ááá áĄáŽáááááĄáŽáá á˘ááááĄ áŠáá˘ááá ááááĄ áááĄáááá á¨áááŤáááá á¨áááĽááááĄ á°ááĄá˘ááááĄ áĄáááŁá¨ááá áááĄáááááááááá PXE áĄáá áááĄááááĄ ááá áá¨á. áŠáá˘ááá ááááĄ áááĄáááá á¨áááŤáááá áááááá áááĄ á°ááĄá˘áá (á¤áááááŁá á áá ááá á˘áŁáááŁá á), á ááááááŞ áá˘ááá áááá áááĄááááá, áááŁáááá¨áá áááá Foreman-áĄ áá ááŹá§áááĄ OS-ááĄ áááĄá˘ááááŞáááĄ. iPXE áĄááĽááŚáááá áááááá EFI á°ááĄá˘ááĄ áŠááá˘ááá áááá áááĄáááááĄááááĄ ááááá§áááááŁáá iPXE-ááĄ á¨áááááá á°ááĄá˘ááĄ áŠáá˘ááá ááááá áááĄááááĄááĄááááĄ áááááĄáá§ááááááá iPXE á¨áááááá iPXE á¨áááááá ááááŽááá áááááĄ áááá  ááááááááŁáá áŠáá˘ááá ááááá áááĄáááááĄááááĄ 