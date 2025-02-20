��    R      �  m   <      �  U   �    G  h   U     �  &   �     �  	   	     	     	  4   *	     _	  
   n	  9   y	  3   �	  (   �	     
     '
     ;
  @   Y
  I   �
  1   �
  K     -   b  =   �  #   �  ;   �     .     C     S      o     �     �     �  �   �     �     �  
   �     �     �     �  =        L     g     x      �     �     �  <   �  9        U  �   c  8   ,  (   e  ,   �  ,   �    �  5     =   7  q   u     �     �          &     ;  �   H  &     �   <  [   �  F   M  K   �  C   �  -   $  /   R  2   �  =   �     �  $     �   0       0   *  1   [  �  �  a   u  K  �  �   #     �  -   �     �     �  !   
  #   ,  T   P  !   �     �  9   �  :     0   V     �     �  .   �  S   �  Q   :  *   �  T   �  -      A   :   8   |   D   �      �      !     2!  )   R!     |!     �!     �!    �!     �"     �"     �"     �"     #  )   (#  S   R#  *   �#     �#     �#  $   $     *$     >$  ]   ^$  F   �$     %  �   %  <   �%  +   $&  3   P&  /   �&  D  �&  4   �'  <   .(  �   k(     �(     )  %   ')     M)     i)  �   |)  ,   n*  �   �*  |   a+  k   �+  Y   J,  U   �,  A   �,  J   <-  2   �-  B   �-     �-  +   .    C.     U/  <   e/  >   �/           ;   3   1   A   E   G                   	   B   ,   5      4   :      0       2            O       ?          %             F       <          R          J              I   9      /                    $             #       )   &   D      @         N   '   +       
   (               C       Q   6         "   -   M      =   K   7   8                         L       >   *   P      .   !   H        * - These bootdisk types were disabled, you can enable them in Administer - Settings. A variant of the per-host image which contains the OS bootloader embedded inside the disk.  This may be useful if chainloading fails on certain hardware, but has the downside that the image must be regenerated for any change in the OS, bootloader or PXELinux templates. All images are usable as either ISOs or as disk images, including being written to a USB disk with `dd`. Allowed bootdisk types Attach ISO image to CDROM drive for %s Back Boot disk Boot disk Help Boot disk based Boot disk download not available for %s architecture Boot disk help Boot disks Command to generate ISO image, use genisoimage or mkisofs Creating new image failed, install truncate utility Detach ISO image from CDROM drive for %s Download generic image Download host image Download subnet generic image Ensure %{file} is readable (or update "Grub2 directory" setting) Failed to attach ISO image to CDROM drive of instance %{name}: %{message} Failed to create a directory within the ESP image Failed to detach ISO image from CDROM drive of instance %{name}: %{message} Failed to format the ESP image via mkfs.msdos Failed to generate ISO image for instance %{name}: %{message} Failed to render boot disk template Failed to upload ISO image for instance %{name}: %{message} Full host '%s' image Full host image Generating ISO image for %s Generic Grub2 EFI image template Generic image Generic image template Generic images Generic images are a reusable disk image that works for any host registered in Foreman.  It requires a basic DHCP and DNS service to function and contact the server, but does not require DHCP reservations or static IP addresses. Grub2 directory Host '%s' image Host image Host image template Host images Host is not in build mode Host is not in build mode, so the template cannot be rendered Host is not in build mode. ISO build failed ISO generation command ISO hybrid conversion failed: %s ISOLINUX directory Installation media caching Installation media files will be cached for full host images List of allowed bootdisk types, remove type to disable it Not available Once chainloaded, the OS bootloader and installer are downloaded directly from the installation media configured in Foreman, and the provisioning script (kickstart/preseed) is downloaded from Foreman. Path to directory containing grubx64.efi and shimx64.efi Path to directory containing iPXE images Path to directory containing isolinux images Path to directory containing syslinux images Per-host images contain data about a particular host registered in Foreman and set up fully static networking, avoiding the requirement for DHCP.  After networking is configured, they chainload from Foreman, picking up the current OS configuration and build state from the server. Please ensure the ipxe-bootimgs package is installed. Please ensure the isolinux/syslinux package(s) are installed. Plugin for Foreman that creates iPXE-based boot disks to provision hosts without the need for PXE infrastructure. SYSLINUX directory Subnet '%s' generic image Subnet boot disks Subnet generic image Subnet image Subnet images are similar to generic images, but chain-loading is done via the TFTP Smart Proxy assigned to the Subnet of the host. The smart proxy must have the "Templates" module enabled and configured. TFTP feature not enabled for subnet %s The OS install continues using the installation media configured in Foreman, and it will typically configure static networking, depending on how the OS iPXE template is configured. These images are more generic than previous images. You can find them at subnet index page. These images are used for host. You can find them at host detail page. This image is generic for all hosts with a provisioning NIC on that subnet. This type of bootdisk is not allowed. Please contact administrator. True for full, false for basic reusable image Unable to find template specified by %s setting Unable to generate disk %{kind} template: %{error} Unable to generate disk template, %{kind} template not found. Unable to mcopy %{file} Upload ISO image to datastore for %s Various types of boot disks can be created to provision hosts without the need for PXE services.  Boot disks can be attached to the host (physical or virtual) which boots from the disk, contacts Foreman and begins the OS installation. iPXE directory iPXE template to use for generic host boot disks iPXE template to use for host-specific boot disks Project-Id-Version: foreman_bootdisk 22.0.2
Report-Msgid-Bugs-To: 
PO-Revision-Date: 2014-02-13 12:12+0000
Last-Translator: Luiz Henrique Vasconcelos <luizvasconceloss@yahoo.com.br>, 2015-2016
Language-Team: Portuguese (Brazil) (http://app.transifex.com/foreman/foreman/language/pt_BR/)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Language: pt_BR
Plural-Forms: nplurals=3; plural=(n == 0 || n == 1) ? 0 : n != 0 && n % 1000000 == 0 ? 1 : 2;
 * - Estes tipos de bootdisk foram desativados, você pode habilitá-los em Administer - Settings. Uma variante da imagem por host que contém o carregador de instalação do SO incorporado no disco. Isso pode ser útil se houver falha no carregamento da cadeia em certos hardwares, mas tem o ponto negativo de que a imagem deve ser regenerada para qualquer mudança no SO, no carregador de instalação ou nos templates PXELinux. Todas as imagens são utilizáveis como ISOs ou como imagens de disco, incluindo o que está sendo gravado em um disco USB com `dd`. Tipos de bootdisk permitidos Anexar imagem ISO à unidade de CDROM para %s Retornar Disco de boot Ajuda do disco de inicialização Baseado em disco de inicialização O download do disco de inicialização não está disponível para a arquitetura %s  Ajuda de disco de inicialização Discos de inicialização Comando para gerar imagem ISO usar genisoimage ou mkisofs Falha ao criar nova imagem, instale o utilitário truncado Desmontar imagem ISO da unidade de CDROM para %s Baixar Imagem genérica Baixar a imagem de host Fazer download da imagem genérica da sub-rede Garantir que {file} seja legível (ou atualizar a configuração "Grub2 directory") Falha ao anexar a imagem ISO ao drive de CD-ROM da instância %{name}: %{message} Falha ao criar um diretório na imagem ESP Falha em destacar a imagem ISO da unidade de CDROM da instância %{name}: %{message} Falha ao formatar a imagem ESP via mkfs.msdos Falha na geração da imagem ISO, por exemplo %{name}: %{message} Falha ao renderizar template de disco de inicialização Falha no carregamento da imagem ISO, por exemplo %{name}: %{message} Hospedagem completa '%s' imagem Imagem de host completa Geração de imagem ISO para %s Template genérico de imagem do Grub2 EFI Imagem genérica Modelo de imagem genérica Imagens genéricas Imagens genéricas são imagens de disco reutilizáveis que funcionam para qualquer host registrado em Foreman. Elas exigem um serviço básico de DHCP e DNS para funcionar e entrar em contato com o servidor, mas não exigem reservas de DHCP ou endereços IP estáticos. Diretório do Grub2 Host '%s' imagem Imagem de host Modelo de imagem do host Hospedar imagens O host não está em modo de construção Host não está no modo de construção, portanto o modelo não pode ser processado O host não está em modo de construção. Construção da ISO falhou Comando de geração ISO A conversão híbrida ISO falhou: %s Diretório ISOLINUX Cache de mídia de instalação Arquivos de mídia de instalação serão armazenados em cache para imagens completas de host Lista de tipos de bootdisk permitidos, remova o tipo para desativá-lo Não disponível Uma vez carregado em série, o bootloader do SO e instalador são baixados diretamente da mídia de instalação configurado em Foreman, e o script de provisionamento (kickstart /preseed) é baixado do Foreman. Caminho para o diretório contendo grubx64.efi e shimx64.efi Caminho do diretório contendo imagens iPXE Caminho para o diretório contendo imagens isolinux Caminho do diretório contendo imagens syslinux Imagens per-host contêm dados sobre um determinado host registrado em Foreman e configuram a rede totalmente estática, evitando a necessidade de DHCP. Depois que a rede está configurada, eles carregam em série a partir do Foreman, pegando a configuração atual do sistema operacional e construindo o estado do servidor. Garanta que o pacote ipxe-bootimgs esteja instalado. Garanta que os pacotes isolinux/syslinux estejam instalados. Plugin para Foreman que cria discos de inicialização baseados em iPXE para provisionar hosts sem a necessidade de infra-estrutura PXE. Diretório SYSLINUX Sub-rede '%s' imagem genérica Discos de inicialização da sub-rede Imagem genérica da subrede Imagem da sub-rede As imagens de sub-rede são semelhantes a imagens genéricas, mas o carregamento de cadeia é feito por meio do proxy inteligente TFTP atribuído à sub-rede do host. O proxy inteligente deve ter o módulo "Modelos" habilitado e configurado. Recurso TFTP não habilitado para subrede %s A instalação do SO continua utilizando a mídia de instalação configurado no Foreman, normalmente irá configurar uma rede estática, dependendo de como o template do SO iPXE está configurado. Estas imagens são mais genéricas do que as imagens anteriores. Você pode encontrá-las na página de índice da sub-rede. Estas imagens são utilizadas para hospedar. Você pode encontrá-las na página de detalhes do anfitrião. Esta imagem é genérica para todos os hosts com um provisionamento NIC naquela sub-rede. Este tipo de bootdisk não é permitido. Favor entrar em contato com o administrador. Verdadeiro para completo, falso para imagem reutilizável básica Não foi possível encontrar o modelo especificado pela configuração %s  Incapaz de gerar modelo de disco %{kind}: %{error} Impossível gerar modelo de disco, %{kind} modelo não encontrado. Incapaz de copiar %{file} Upload de imagem ISO para datastore para %s Vários tipos de discos de inicialização podem ser criados para fornecer hosts sem a necessidade de serviços PXE. Discos de inicialização podem ser anexados ao host (físico ou virtual), que iniciam a partir do disco, contacta o Foreman e começa a instalação do SO. Diretório iPXE Template iPXE para uso em discos de boot de hosts genéricos Template iPXE para uso em discos de boot de hosts específicos 