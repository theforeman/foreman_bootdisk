 locales['foreman_bootdisk'] = locales['foreman_bootdisk'] || {}; locales['foreman_bootdisk']['pt_BR'] = {
  "domain": "foreman_bootdisk",
  "locale_data": {
    "foreman_bootdisk": {
      "": {
        "Project-Id-Version": "foreman_bootdisk 21.0.4",
        "Report-Msgid-Bugs-To": "",
        "POT-Creation-Date": "2023-01-05 20:17+0100",
        "PO-Revision-Date": "2014-02-13 12:12+0000",
        "Last-Translator": "Luiz Henrique Vasconcelos <luizvasconceloss@yahoo.com.br>, 2015-2016",
        "Language-Team": "Portuguese (Brazil) (http://app.transifex.com/foreman/foreman/language/pt_BR/)",
        "MIME-Version": "1.0",
        "Content-Type": "text/plain; charset=UTF-8",
        "Content-Transfer-Encoding": "8bit",
        "Language": "pt_BR",
        "Plural-Forms": "nplurals=3; plural=(n == 0 || n == 1) ? 0 : n != 0 && n % 1000000 == 0 ? 1 : 2;",
        "lang": "pt_BR",
        "domain": "foreman_bootdisk",
        "plural_forms": "nplurals=3; plural=(n == 0 || n == 1) ? 0 : n != 0 && n % 1000000 == 0 ? 1 : 2;"
      },
      "This type of bootdisk is not allowed. Please contact administrator.": [
        "Este tipo de bootdisk não é permitido. Favor entrar em contato com o administrador."
      ],
      "Boot disks": [
        "Discos de inicialização"
      ],
      "Download generic image": [
        "Baixar Imagem genérica"
      ],
      "Download host image": [
        "Baixar a imagem de host"
      ],
      "True for full, false for basic reusable image": [
        "Verdadeiro para completo, falso para imagem reutilizável básica"
      ],
      "Host is not in build mode": [
        "O host não está em modo de construção"
      ],
      "Subnet boot disks": [
        "Discos de inicialização da sub-rede"
      ],
      "Download subnet generic image": [
        "Fazer download da imagem genérica da sub-rede"
      ],
      "TFTP feature not enabled for subnet %s": [
        "Recurso TFTP não habilitado para subrede %s"
      ],
      "Host is not in build mode.": [
        "O host não está em modo de construção."
      ],
      "Failed to render boot disk template": [
        "Falha ao renderizar template de disco de inicialização"
      ],
      "Host '%s' image": [
        "Host '%s' imagem"
      ],
      "Full host '%s' image": [
        "Hospedagem completa '%s' imagem"
      ],
      "Boot disk help": [
        "Ajuda de disco de inicialização"
      ],
      "Boot disk Help": [
        "Ajuda do disco de inicialização"
      ],
      "Boot disk": [
        "Disco de boot"
      ],
      "Boot disk download not available for %s architecture": [
        "O download do disco de inicialização não está disponível para a arquitetura %s "
      ],
      "Subnet '%s' generic image": [
        "Sub-rede '%s' imagem genérica"
      ],
      "Subnet generic image": [
        "Imagem genérica da subrede"
      ],
      "Generic image": [
        "Imagem genérica"
      ],
      "Unable to find template specified by %s setting": [
        "Não foi possível encontrar o modelo especificado pela configuração %s "
      ],
      "Generating ISO image for %s": [
        "Geração de imagem ISO para %s"
      ],
      "Upload ISO image to datastore for %s": [
        "Upload de imagem ISO para datastore para %s"
      ],
      "Attach ISO image to CDROM drive for %s": [
        "Anexar imagem ISO à unidade de CDROM para %s"
      ],
      "Detach ISO image from CDROM drive for %s": [
        "Desmontar imagem ISO da unidade de CDROM para %s"
      ],
      "Failed to generate ISO image for instance %{name}: %{message}": [
        "Falha na geração da imagem ISO, por exemplo %{name}: %{message}"
      ],
      "Failed to upload ISO image for instance %{name}: %{message}": [
        "Falha no carregamento da imagem ISO, por exemplo %{name}: %{message}"
      ],
      "Failed to attach ISO image to CDROM drive of instance %{name}: %{message}": [
        "Falha ao anexar a imagem ISO ao drive de CD-ROM da instância %{name}: %{message}"
      ],
      "Failed to detach ISO image from CDROM drive of instance %{name}: %{message}": [
        "Falha em destacar a imagem ISO da unidade de CDROM da instância %{name}: %{message}"
      ],
      "Host is not in build mode, so the template cannot be rendered": [
        "Host não está no modo de construção, portanto o modelo não pode ser processado"
      ],
      "Unable to generate disk template, %{kind} template not found.": [
        "Impossível gerar modelo de disco, %{kind} modelo não encontrado."
      ],
      "Unable to generate disk %{kind} template: %{error}": [
        "Incapaz de gerar modelo de disco %{kind}: %{error}"
      ],
      "Please ensure the isolinux/syslinux package(s) are installed.": [
        "Garanta que os pacotes isolinux/syslinux estejam instalados."
      ],
      "Please ensure the ipxe-bootimgs package is installed.": [
        "Garanta que o pacote ipxe-bootimgs esteja instalado."
      ],
      "Creating new image failed, install truncate utility": [
        "Falha ao criar nova imagem, instale o utilitário truncado"
      ],
      "Failed to format the ESP image via mkfs.msdos": [
        "Falha ao formatar a imagem ESP via mkfs.msdos"
      ],
      "Failed to create a directory within the ESP image": [
        "Falha ao criar um diretório na imagem ESP"
      ],
      "Ensure %{file} is readable (or update \\\"Grub2 directory\\\" setting)": [
        "Garantir que {file} seja legível (ou atualizar a configuração \\\"Grub2 directory\\\")"
      ],
      "Unable to mcopy %{file}": [
        "Incapaz de copiar %{file}"
      ],
      "ISO build failed": [
        "Construção da ISO falhou"
      ],
      "ISO hybrid conversion failed: %s": [
        "A conversão híbrida ISO falhou: %s"
      ],
      "Back": [
        "Retornar"
      ],
      "Various types of boot disks can be created to provision hosts without the need for PXE services.  Boot disks can be attached to the host (physical or virtual) which boots from the disk, contacts Foreman and begins the OS installation.": [
        "Vários tipos de discos de inicialização podem ser criados para fornecer hosts sem a necessidade de serviços PXE. Discos de inicialização podem ser anexados ao host (físico ou virtual), que iniciam a partir do disco, contacta o Foreman e começa a instalação do SO."
      ],
      "All images are usable as either ISOs or as disk images, including being written to a USB disk with `dd`.": [
        "Todas as imagens são utilizáveis como ISOs ou como imagens de disco, incluindo o que está sendo gravado em um disco USB com `dd`."
      ],
      "Host images": [
        "Hospedar imagens"
      ],
      "These images are used for host. You can find them at host detail page.": [
        "Estas imagens são utilizadas para hospedar. Você pode encontrá-las na página de detalhes do anfitrião."
      ],
      "Host image": [
        "Imagem de host"
      ],
      "Per-host images contain data about a particular host registered in Foreman and set up fully static networking, avoiding the requirement for DHCP.  After networking is configured, they chainload from Foreman, picking up the current OS configuration and build state from the server.": [
        "Imagens per-host contêm dados sobre um determinado host registrado em Foreman e configuram a rede totalmente estática, evitando a necessidade de DHCP. Depois que a rede está configurada, eles carregam em série a partir do Foreman, pegando a configuração atual do sistema operacional e construindo o estado do servidor."
      ],
      "Once chainloaded, the OS bootloader and installer are downloaded directly from the installation media configured in Foreman, and the provisioning script (kickstart/preseed) is downloaded from Foreman.": [
        "Uma vez carregado em série, o bootloader do SO e instalador são baixados diretamente da mídia de instalação configurado em Foreman, e o script de provisionamento (kickstart /preseed) é baixado do Foreman."
      ],
      "Full host image": [
        "Imagem de host completa"
      ],
      "A variant of the per-host image which contains the OS bootloader embedded inside the disk.  This may be useful if chainloading fails on certain hardware, but has the downside that the image must be regenerated for any change in the OS, bootloader or PXELinux templates.": [
        "Uma variante da imagem por host que contém o carregador de instalação do SO incorporado no disco. Isso pode ser útil se houver falha no carregamento da cadeia em certos hardwares, mas tem o ponto negativo de que a imagem deve ser regenerada para qualquer mudança no SO, no carregador de instalação ou nos templates PXELinux."
      ],
      "Generic images": [
        "Imagens genéricas"
      ],
      "These images are more generic than previous images. You can find them at subnet index page.": [
        "Estas imagens são mais genéricas do que as imagens anteriores. Você pode encontrá-las na página de índice da sub-rede."
      ],
      "Generic images are a reusable disk image that works for any host registered in Foreman.  It requires a basic DHCP and DNS service to function and contact the server, but does not require DHCP reservations or static IP addresses.": [
        "Imagens genéricas são imagens de disco reutilizáveis que funcionam para qualquer host registrado em Foreman. Elas exigem um serviço básico de DHCP e DNS para funcionar e entrar em contato com o servidor, mas não exigem reservas de DHCP ou endereços IP estáticos."
      ],
      "The OS install continues using the installation media configured in Foreman, and it will typically configure static networking, depending on how the OS iPXE template is configured.": [
        "A instalação do SO continua utilizando a mídia de instalação configurado no Foreman, normalmente irá configurar uma rede estática, dependendo de como o template do SO iPXE está configurado."
      ],
      "Subnet image": [
        "Imagem da sub-rede"
      ],
      "Subnet images are similar to generic images, but chain-loading is done via the TFTP Smart Proxy assigned to the Subnet of the host. The smart proxy must have the \\\"Templates\\\" module enabled and configured.": [
        "As imagens de sub-rede são semelhantes a imagens genéricas, mas o carregamento de cadeia é feito por meio do proxy inteligente TFTP atribuído à sub-rede do host. O proxy inteligente deve ter o módulo \\\"Modelos\\\" habilitado e configurado."
      ],
      "This image is generic for all hosts with a provisioning NIC on that subnet.": [
        "Esta imagem é genérica para todos os hosts com um provisionamento NIC naquela sub-rede."
      ],
      "* - These bootdisk types were disabled, you can enable them in Administer - Settings.": [
        "* - Estes tipos de bootdisk foram desativados, você pode habilitá-los em Administer - Settings."
      ],
      "Boot disk based": [
        "Baseado em disco de inicialização"
      ],
      "iPXE directory": [
        "Diretório iPXE"
      ],
      "Path to directory containing iPXE images": [
        "Caminho do diretório contendo imagens iPXE"
      ],
      "ISOLINUX directory": [
        "Diretório ISOLINUX"
      ],
      "Path to directory containing isolinux images": [
        "Caminho para o diretório contendo imagens isolinux"
      ],
      "SYSLINUX directory": [
        "Diretório SYSLINUX"
      ],
      "Path to directory containing syslinux images": [
        "Caminho do diretório contendo imagens syslinux"
      ],
      "Grub2 directory": [
        "Diretório do Grub2"
      ],
      "Path to directory containing grubx64.efi and shimx64.efi": [
        "Caminho para o diretório contendo grubx64.efi e shimx64.efi"
      ],
      "Host image template": [
        "Modelo de imagem do host"
      ],
      "iPXE template to use for host-specific boot disks": [
        "Template iPXE para uso em discos de boot de hosts específicos"
      ],
      "Generic image template": [
        "Modelo de imagem genérica"
      ],
      "iPXE template to use for generic host boot disks": [
        "Template iPXE para uso em discos de boot de hosts genéricos"
      ],
      "Generic Grub2 EFI image template": [
        "Template genérico de imagem do Grub2 EFI"
      ],
      "iPXE template to use for generic EFI host boot disks": [
        ""
      ],
      "ISO generation command": [
        "Comando de geração ISO"
      ],
      "Command to generate ISO image, use genisoimage or mkisofs": [
        "Comando para gerar imagem ISO usar genisoimage ou mkisofs"
      ],
      "Installation media caching": [
        "Cache de mídia de instalação"
      ],
      "Installation media files will be cached for full host images": [
        "Arquivos de mídia de instalação serão armazenados em cache para imagens completas de host"
      ],
      "Allowed bootdisk types": [
        "Tipos de bootdisk permitidos"
      ],
      "List of allowed bootdisk types, remove type to disable it": [
        "Lista de tipos de bootdisk permitidos, remova o tipo para desativá-lo"
      ],
      "Not available": [
        "Não disponível"
      ],
      "Remote action:": [
        "Ação remota:"
      ],
      "Import Puppet classes": [
        "Importar classes de Puppet"
      ],
      "Import facts": [
        "Importar fatos"
      ],
      "Action with sub plans": [
        "Ação com subplanos "
      ],
      "Plugin for Foreman that creates iPXE-based boot disks to provision hosts without the need for PXE infrastructure.": [
        "Plugin para Foreman que cria discos de inicialização baseados em iPXE para provisionar hosts sem a necessidade de infra-estrutura PXE."
      ]
    }
  }
};