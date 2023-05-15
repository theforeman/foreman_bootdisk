 locales['foreman_bootdisk'] = locales['foreman_bootdisk'] || {}; locales['foreman_bootdisk']['zh_CN'] = {
  "domain": "foreman_bootdisk",
  "locale_data": {
    "foreman_bootdisk": {
      "": {
        "Project-Id-Version": "foreman_bootdisk 21.0.4",
        "Report-Msgid-Bugs-To": "",
        "POT-Creation-Date": "2023-01-05 20:17+0100",
        "PO-Revision-Date": "2014-02-13 12:12+0000",
        "Last-Translator": "FULL NAME <EMAIL@ADDRESS>",
        "Language-Team": "Chinese (China) (http://app.transifex.com/foreman/foreman/language/zh_CN/)",
        "MIME-Version": "1.0",
        "Content-Type": "text/plain; charset=UTF-8",
        "Content-Transfer-Encoding": "8bit",
        "Language": "zh_CN",
        "Plural-Forms": "nplurals=1; plural=0;",
        "lang": "zh_CN",
        "domain": "foreman_bootdisk",
        "plural_forms": "nplurals=1; plural=0;"
      },
      "This type of bootdisk is not allowed. Please contact administrator.": [
        "不允许使用这种类型的引导盘。请与管理员联系。"
      ],
      "Boot disks": [
        "引导盘"
      ],
      "Download generic image": [
        "下载通用镜像"
      ],
      "Download host image": [
        "下载主机镜像"
      ],
      "True for full, false for basic reusable image": [
        "True 代表全部，false 代表基本的可重复使用的镜像"
      ],
      "Host is not in build mode": [
        "主机不在构建模式中"
      ],
      "Subnet boot disks": [
        "子网引导磁盘"
      ],
      "Download subnet generic image": [
        "下载子网通用镜像"
      ],
      "TFTP feature not enabled for subnet %s": [
        "没有为子网 %s 启用 TFTP 功能"
      ],
      "Host is not in build mode.": [
        "主机不在构建模式。"
      ],
      "Failed to render boot disk template": [
        "未能提供引导磁盘模板"
      ],
      "Host '%s' image": [
        "主机 '%s' 镜像"
      ],
      "Full host '%s' image": [
        "完整主机 '%s' 镜像"
      ],
      "Boot disk help": [
        "引导磁盘帮助"
      ],
      "Boot disk Help": [
        "引导磁盘帮助"
      ],
      "Boot disk": [
        "引导磁盘"
      ],
      "Boot disk download not available for %s architecture": [
        "引导磁盘下载不适用于 %s 架构"
      ],
      "Subnet '%s' generic image": [
        "子网 '%s' 通用镜像"
      ],
      "Subnet generic image": [
        "子网通用镜像"
      ],
      "Generic image": [
        "通用镜像"
      ],
      "Unable to find template specified by %s setting": [
        "找不到由 %s 设置指定的模板"
      ],
      "Generating ISO image for %s": [
        "为 %s 生成的 ISO 镜像"
      ],
      "Upload ISO image to datastore for %s": [
        "为 %s 将 ISO 镜像上传至数据存储"
      ],
      "Attach ISO image to CDROM drive for %s": [
        "为 %s 将 ISO 镜像附加至 CDROM 驱动"
      ],
      "Detach ISO image from CDROM drive for %s": [
        "为 %s 从 CDROM 驱动取消附加 ISO 镜像"
      ],
      "Failed to generate ISO image for instance %{name}: %{message}": [
        "为实例 %%{name} 生成 ISO 镜像：%%{message}"
      ],
      "Failed to upload ISO image for instance %{name}: %{message}": [
        "为实例 %%{name} 上传 ISO 镜像失败：%%{message}"
      ],
      "Failed to attach ISO image to CDROM drive of instance %{name}: %{message}": [
        "将 ISO 镜像附加到实例 %%{name} 的 CDROM 驱动失败：%%{message}"
      ],
      "Failed to detach ISO image from CDROM drive of instance %{name}: %{message}": [
        "未能成功将 ISO 镜像从实例 %%{name} 的 CDROM 驱动中断开：%%{message}"
      ],
      "Host is not in build mode, so the template cannot be rendered": [
        "主机没有处于构建模式，因此模板不能被处理"
      ],
      "Unable to generate disk template, %{kind} template not found.": [
        "无法生成磁盘模板，未找到 %%{kind} 模板。"
      ],
      "Unable to generate disk %{kind} template: %{error}": [
        "无法生成磁盘 %%{kind} 模板 : %%{error}"
      ],
      "Please ensure the isolinux/syslinux package(s) are installed.": [
        "请确保已安装了 isolinux/syslinux 软件包。"
      ],
      "Please ensure the ipxe-bootimgs package is installed.": [
        "请确保已安装了 ipxe-bootimgs 软件包。"
      ],
      "Creating new image failed, install truncate utility": [
        "创建新镜像失败，安装截断实用程序"
      ],
      "Failed to format the ESP image via mkfs.msdos": [
        "无法通过 mkfs.msdos 格式化 ESP 镜像"
      ],
      "Failed to create a directory within the ESP image": [
        "无法在 ESP 镜像中创建目录"
      ],
      "Ensure %{file} is readable (or update \\\"Grub2 directory\\\" setting)": [
        "确保 %%{file} 是可读的（或更新 \\\"Grub2 directory\\\" 设置）"
      ],
      "Unable to mcopy %{file}": [
        "无法 mcopy %%{file}"
      ],
      "ISO build failed": [
        "ISO 构建失败"
      ],
      "ISO hybrid conversion failed: %s": [
        "ISO 混合转换失败：%s"
      ],
      "Back": [
        "返回"
      ],
      "Various types of boot disks can be created to provision hosts without the need for PXE services.  Boot disks can be attached to the host (physical or virtual) which boots from the disk, contacts Foreman and begins the OS installation.": [
        "可以创建不同类型的启动磁盘来置备主机，而无需 PXE 服务。引导磁盘可以附加到主机（物理或虚拟），该主机从磁盘引导，联系 Foreman 并开始进行 OS 安装。"
      ],
      "All images are usable as either ISOs or as disk images, including being written to a USB disk with `dd`.": [
        "所有镜像都可用作 ISO 或磁盘镜像，包括使用 `dd` 写入 USB 磁盘。"
      ],
      "Host images": [
        "主机镜像"
      ],
      "These images are used for host. You can find them at host detail page.": [
        "这些镜像用于主机。您可以在主机详细信息页上找到它们。"
      ],
      "Host image": [
        "主机镜像"
      ],
      "Per-host images contain data about a particular host registered in Foreman and set up fully static networking, avoiding the requirement for DHCP.  After networking is configured, they chainload from Foreman, picking up the current OS configuration and build state from the server.": [
        "每个主机镜像包含有关在 Foreman 中注册的特定主机的数据，并建立了完全静态的网络连接，从而可以不需要 DHCP。配置网络后，他们从 Foreman 进行链加载，选择当前的 OS 配置并从服务器构建状态。"
      ],
      "Once chainloaded, the OS bootloader and installer are downloaded directly from the installation media configured in Foreman, and the provisioning script (kickstart/preseed) is downloaded from Foreman.": [
        "链式加载后，将直接从 Foreman 中配置的安装介质中下载 OS Bootloader 和安装程序，并从 Foreman 中下载预配置脚本（kickstart / preseed）。"
      ],
      "Full host image": [
        "完整的主机镜像"
      ],
      "A variant of the per-host image which contains the OS bootloader embedded inside the disk.  This may be useful if chainloading fails on certain hardware, but has the downside that the image must be regenerated for any change in the OS, bootloader or PXELinux templates.": [
        "单个主机镜像的变体，其磁盘内包含 OS 引导装载程序。当某些硬件上的连锁装载失败之时，这可能有用，但是也存在缺点，即 OS、引导状态程序或 PXELinux 模板发生任何变化时都必须重新生成该镜像。"
      ],
      "Generic images": [
        "通用镜像"
      ],
      "These images are more generic than previous images. You can find them at subnet index page.": [
        "这些镜像比以前的镜像更通用。您可以在子网索引页面找到它们。"
      ],
      "Generic images are a reusable disk image that works for any host registered in Foreman.  It requires a basic DHCP and DNS service to function and contact the server, but does not require DHCP reservations or static IP addresses.": [
        "通用镜像是可重复使用的磁盘镜像，适用于在 Foreman 中注册的任何主机。它需要基本的 DHCP 和 DNS 服务才能正常工作并与服务器联系，但不需要 DHCP 保留或静态 IP 地址。"
      ],
      "The OS install continues using the installation media configured in Foreman, and it will typically configure static networking, depending on how the OS iPXE template is configured.": [
        "操作系统将继续使用 Foreman 中配置的安装介质进行安装，并且通常将配置静态网络，具体取决于 OS iPXE 模板的配置方式。"
      ],
      "Subnet image": [
        "子网镜像"
      ],
      "Subnet images are similar to generic images, but chain-loading is done via the TFTP Smart Proxy assigned to the Subnet of the host. The smart proxy must have the \\\"Templates\\\" module enabled and configured.": [
        "子网镜像与通用镜像类似，但是链式加载是通过分配给主机子网的 TFTP 智能代理完成的。智能代理必须启用并配置了 “Templates” 模块。"
      ],
      "This image is generic for all hosts with a provisioning NIC on that subnet.": [
        "该镜像对于该子网上具有配置 NIC 的所有主机都是通用的。"
      ],
      "* - These bootdisk types were disabled, you can enable them in Administer - Settings.": [
        "* - 这些 bootdisk 类型已被禁用，您可以在 Administer - Settings 中启用它们。"
      ],
      "Boot disk based": [
        "基于引导磁盘"
      ],
      "iPXE directory": [
        "iPXE 目录"
      ],
      "Path to directory containing iPXE images": [
        "到包含 iPXE 镜像的目录的路径"
      ],
      "ISOLINUX directory": [
        "ISOLINUX 目录"
      ],
      "Path to directory containing isolinux images": [
        "到包含 isolinux 镜像目录的路径"
      ],
      "SYSLINUX directory": [
        "SYSLINUX 目录"
      ],
      "Path to directory containing syslinux images": [
        "包含 syslinux 镜像的目录的路径"
      ],
      "Grub2 directory": [
        "Grub2 目录"
      ],
      "Path to directory containing grubx64.efi and shimx64.efi": [
        "包含 grubx64.efi 和 shimx64.efi 的目录的路径"
      ],
      "Host image template": [
        "主机镜像模板"
      ],
      "iPXE template to use for host-specific boot disks": [
        "特定于主机的引导磁盘使用的 iPXE 模板"
      ],
      "Generic image template": [
        "通用镜像模板"
      ],
      "iPXE template to use for generic host boot disks": [
        "通用主机引导磁盘使用的 iPXE 模板"
      ],
      "Generic Grub2 EFI image template": [
        "通用 Grub2 EFI 镜像模板"
      ],
      "iPXE template to use for generic EFI host boot disks": [
        ""
      ],
      "ISO generation command": [
        "ISO 生成命令"
      ],
      "Command to generate ISO image, use genisoimage or mkisofs": [
        "创建 ISO 镜像的命令，使用 genisoimage 或 mkisofs"
      ],
      "Installation media caching": [
        "安装介质缓存"
      ],
      "Installation media files will be cached for full host images": [
        "安装介质文件将被缓存用于完整主机镜像"
      ],
      "Allowed bootdisk types": [
        "允许的启动盘类型"
      ],
      "List of allowed bootdisk types, remove type to disable it": [
        "允许的启动盘类型列表，删除类型以将其禁用"
      ],
      "Not available": [
        "不可用"
      ],
      "Remote action:": [
        "远程操作："
      ],
      "Import Puppet classes": [
        "导入 Puppet 类"
      ],
      "Import facts": [
        "导入事实"
      ],
      "Action with sub plans": [
        "有子计划的操作"
      ],
      "Plugin for Foreman that creates iPXE-based boot disks to provision hosts without the need for PXE infrastructure.": [
        "Foreman 插件可创建基于 iPXE 的启动磁盘来配置主机，而无需 PXE 基础结构。"
      ]
    }
  }
};