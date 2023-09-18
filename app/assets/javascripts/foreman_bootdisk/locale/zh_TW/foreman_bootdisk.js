 locales['foreman_bootdisk'] = locales['foreman_bootdisk'] || {}; locales['foreman_bootdisk']['zh_TW'] = {
  "domain": "foreman_bootdisk",
  "locale_data": {
    "foreman_bootdisk": {
      "": {
        "Project-Id-Version": "foreman_bootdisk 21.1.0",
        "Report-Msgid-Bugs-To": "",
        "POT-Creation-Date": "2023-09-18 14:01+0200",
        "PO-Revision-Date": "2014-02-13 12:12+0000",
        "Last-Translator": "FULL NAME <EMAIL@ADDRESS>",
        "Language-Team": "Chinese (Taiwan) (http://app.transifex.com/foreman/foreman/language/zh_TW/)",
        "MIME-Version": "1.0",
        "Content-Type": "text/plain; charset=UTF-8",
        "Content-Transfer-Encoding": "8bit",
        "Language": "zh_TW",
        "Plural-Forms": "nplurals=1; plural=0;",
        "lang": "zh_TW",
        "domain": "foreman_bootdisk",
        "plural_forms": "nplurals=1; plural=0;"
      },
      "This type of bootdisk is not allowed. Please contact administrator.": [
        ""
      ],
      "Boot disks": [
        "開機磁碟"
      ],
      "Download generic image": [
        "下載泛型映像檔"
      ],
      "Download host image": [
        "下載主機映像檔"
      ],
      "True for full, false for basic reusable image": [
        "「true」代表完整，「false」則代表可重複使用的基本映像檔"
      ],
      "Host is not in build mode": [
        ""
      ],
      "Subnet boot disks": [
        "子網路開機磁碟"
      ],
      "Download subnet generic image": [
        "下載子網路泛型映像檔"
      ],
      "TFTP feature not enabled for subnet %s": [
        "TFTP 功能並未啟動給子網路 %s 使用"
      ],
      "Host is not in build mode.": [
        ""
      ],
      "Failed to render boot disk template": [
        "轉譯開機磁碟範本失敗"
      ],
      "Host '%s' image": [
        "主機「%s」映像檔"
      ],
      "Full host '%s' image": [
        "完整的主機 '%s' 映像檔"
      ],
      "Boot disk help": [
        ""
      ],
      "Boot disk Help": [
        ""
      ],
      "Boot disk": [
        "開機磁碟"
      ],
      "Boot disk download not available for %s architecture": [
        ""
      ],
      "Subnet '%s' generic image": [
        "子網路「%s」泛型映像檔"
      ],
      "Subnet generic image": [
        ""
      ],
      "Generic image": [
        "泛型映像檔"
      ],
      "Unable to find template specified by %s setting": [
        "找不到 %s 設定所指定的範本"
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
        "主機不在組建模式下，因此無法編寫範本"
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
        "建立 ISO 失敗"
      ],
      "ISO hybrid conversion failed: %s": [
        ""
      ],
      "Back": [
        "上一步"
      ],
      "Various types of boot disks can be created to provision hosts without the need for PXE services.  Boot disks can be attached to the host (physical or virtual) which boots from the disk, contacts Foreman and begins the OS installation.": [
        "您可建立各種不同類型的開機磁碟來在不使用 PXE 服務的情況下佈建主機。開機磁碟能連接至由磁碟開機的主機（實體或虛擬），聯絡 Foreman 並開始進行 OS 的安裝程序。"
      ],
      "All images are usable as either ISOs or as disk images, including being written to a USB disk with `dd`.": [
        "所有映像檔皆能作為 ISO 或是磁碟映像檔使用，包括以 `dd` 寫入一個 USB 磁碟中。"
      ],
      "Host images": [
        ""
      ],
      "These images are used for host. You can find them at host detail page.": [
        ""
      ],
      "Host image": [
        "主機映像檔"
      ],
      "Per-host images contain data about a particular host registered in Foreman and set up fully static networking, avoiding the requirement for DHCP.  After networking is configured, they chainload from Foreman, picking up the current OS configuration and build state from the server.": [
        "個別主機的映像檔包含了有關於向 Foreman 註冊的特定主機的資料，並且會設置完整靜態的網路，以避免需要使用到 DHCP。在配置了網路後，它們便會由 Foreman 進行 chainload，取得目前的 OS 配置，並由伺服器建立狀態。"
      ],
      "Once chainloaded, the OS bootloader and installer are downloaded directly from the installation media configured in Foreman, and the provisioning script (kickstart/preseed) is downloaded from Foreman.": [
        "在 chainload 之後，OS 開機載入程式和安裝程式將會直接從 Foreman 中所配置的安裝媒介下載，而佈建 script（kickstart/preseed）則會由 Foreman 下載。"
      ],
      "Full host image": [
        "完整的主機映像檔"
      ],
      "A variant of the per-host image which contains the OS bootloader embedded inside the disk.  This may be useful if chainloading fails on certain hardware, but has the downside that the image must be regenerated for any change in the OS, bootloader or PXELinux templates.": [
        "個別主機映像檔的變體，磁碟中嵌入了 OS 的開機載入程式。這對於在特定硬體上的 chainloading 失敗時特別有幫助，不過缺點就是若要對 OS、開機載入程式或 PXELinux 範本進行任何更改，映像檔就必須重新產生。"
      ],
      "Generic images": [
        ""
      ],
      "These images are more generic than previous images. You can find them at subnet index page.": [
        ""
      ],
      "Generic images are a reusable disk image that works for any host registered in Foreman.  It requires a basic DHCP and DNS service to function and contact the server, but does not require DHCP reservations or static IP addresses.": [
        "泛型映像檔是個可重複使用的磁碟映像檔，並且可使用於任何向 Foreman 註冊過的主機上。它需要一項基本的 DHCP 和 DNS 服務才能運作和聯絡伺服器，不過並不需要 DHCP 預留或靜態 IP 位址。"
      ],
      "The OS install continues using the installation media configured in Foreman, and it will typically configure static networking, depending on how the OS iPXE template is configured.": [
        "OS 安裝程序會繼續使用配置於 Foreman 中的安裝媒介，並且它一般會根據 OS iPXE 範本的配置方法來配置靜態網路。"
      ],
      "Subnet image": [
        "子網路映像檔"
      ],
      "Subnet images are similar to generic images, but chain-loading is done via the TFTP Smart Proxy assigned to the Subnet of the host. The smart proxy must have the \\\"Templates\\\" module enabled and configured.": [
        "子網路映像檔跟泛型映像檔類似，但連鎖載入（chain-loading）是透過 TFTP 智慧型代理指定至主機的子網路。智慧型代理必須啟用並配置了「模版」（Templates）模組。"
      ],
      "This image is generic for all hosts with a provisioning NIC on that subnet.": [
        "這映像檔對在該子網路上配有網路卡的所有主機來說，是通用的。"
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
        "包含 iPXE 映像檔的目錄之路徑"
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
        "包含 syslinux 映像檔的目錄之路徑"
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
        "使用來作為主機特屬開機磁碟的 iPXE 範本"
      ],
      "Generic image template": [
        ""
      ],
      "iPXE template to use for generic host boot disks": [
        "使用來作為泛型主機開機磁碟的 iPXE 範本"
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
        "請使用 genisoimage 或是 mkisofs 來作為產生 ISO 映像檔的指令"
      ],
      "Installation media caching": [
        ""
      ],
      "Installation media files will be cached for full host images": [
        "安裝媒介檔案將會被快取以作為完整的主機映像檔"
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
        "遠端動作："
      ],
      "Import Puppet classes": [
        "匯入 Puppet 類別"
      ],
      "Import facts": [
        "匯入詳情"
      ],
      "Action with sub plans": [
        "有子計畫的動作"
      ],
      "Plugin for Foreman that creates iPXE-based boot disks to provision hosts without the need for PXE infrastructure.": [
        "能建立基於 iPXE 的開機磁碟的 Foreman 外掛程式，以在不需要 PXE 設備的情況下佈建主機。"
      ]
    }
  }
};