 locales['foreman_bootdisk'] = locales['foreman_bootdisk'] || {}; locales['foreman_bootdisk']['ru'] = {
  "domain": "foreman_bootdisk",
  "locale_data": {
    "foreman_bootdisk": {
      "": {
        "Project-Id-Version": "foreman_bootdisk 21.0.4",
        "Report-Msgid-Bugs-To": "",
        "PO-Revision-Date": "2014-02-13 12:12+0000",
        "Last-Translator": "Vladimir Pavlov <v.pavlov@i-teco.ru>, 2015",
        "Language-Team": "Russian (http://app.transifex.com/foreman/foreman/language/ru/)",
        "MIME-Version": "1.0",
        "Content-Type": "text/plain; charset=UTF-8",
        "Content-Transfer-Encoding": "8bit",
        "Language": "ru",
        "Plural-Forms": "nplurals=4; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<12 || n%100>14) ? 1 : n%10==0 || (n%10>=5 && n%10<=9) || (n%100>=11 && n%100<=14)? 2 : 3);",
        "lang": "ru",
        "domain": "foreman_bootdisk",
        "plural_forms": "nplurals=4; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<12 || n%100>14) ? 1 : n%10==0 || (n%10>=5 && n%10<=9) || (n%100>=11 && n%100<=14)? 2 : 3);"
      },
      "* - These bootdisk types were disabled, you can enable them in Administer - Settings.": [
        ""
      ],
      "A variant of the per-host image which contains the OS bootloader embedded inside the disk.  This may be useful if chainloading fails on certain hardware, but has the downside that the image must be regenerated for any change in the OS, bootloader or PXELinux templates.": [
        "Вариант для создания индивидуального образа с интеграцией загрузчика операционной системы. Подходит, если по какой-то причине цепная загрузка невозможна. Основной недостаток такого подхода заключается в том, что при любых изменениях операционной системы, загрузчика или шаблона PXELinux образ надо будет создавать заново."
      ],
      "Action with sub plans": [
        "Действия с подпланами"
      ],
      "All images are usable as either ISOs or as disk images, including being written to a USB disk with `dd`.": [
        "Все образы используются как ISO или образы дисков, включая записанные на USB диск командой 'dd'."
      ],
      "Allowed bootdisk types": [
        ""
      ],
      "Attach ISO image to CDROM drive for %s": [
        ""
      ],
      "Back": [
        "Назад"
      ],
      "Boot disk": [
        "Загрузочный диск"
      ],
      "Boot disk Help": [
        ""
      ],
      "Boot disk based": [
        ""
      ],
      "Boot disk download not available for %s architecture": [
        ""
      ],
      "Boot disk help": [
        ""
      ],
      "Boot disks": [
        "Загрузочные диски"
      ],
      "Command to generate ISO image, use genisoimage or mkisofs": [
        "Команда создания ISO-образа. Используйте genisoimage или mkisofs"
      ],
      "Creating new image failed, install truncate utility": [
        ""
      ],
      "Detach ISO image from CDROM drive for %s": [
        ""
      ],
      "Download generic image": [
        "Скачать общий образ"
      ],
      "Download host image": [
        "Скачать образ узла"
      ],
      "Download subnet generic image": [
        "Загрузить стандартный образ для подсети"
      ],
      "Ensure %{file} is readable (or update \\\"Grub2 directory\\\" setting)": [
        ""
      ],
      "Failed to attach ISO image to CDROM drive of instance %{name}: %{message}": [
        ""
      ],
      "Failed to create a directory within the ESP image": [
        ""
      ],
      "Failed to detach ISO image from CDROM drive of instance %{name}: %{message}": [
        ""
      ],
      "Failed to format the ESP image via mkfs.msdos": [
        ""
      ],
      "Failed to generate ISO image for instance %{name}: %{message}": [
        ""
      ],
      "Failed to render boot disk template": [
        "Не удалось сформировать шаблон загрузочного диска"
      ],
      "Failed to upload ISO image for instance %{name}: %{message}": [
        ""
      ],
      "Full host '%s' image": [
        "Полный образ узлы '%s'"
      ],
      "Full host image": [
        "Полный образ узла"
      ],
      "Generating ISO image for %s": [
        "Создается ISO для %s..."
      ],
      "Generic Grub2 EFI image template": [
        ""
      ],
      "Generic image": [
        "Стандартный образ"
      ],
      "Generic image template": [
        ""
      ],
      "Generic images": [
        ""
      ],
      "Generic images are a reusable disk image that works for any host registered in Foreman.  It requires a basic DHCP and DNS service to function and contact the server, but does not require DHCP reservations or static IP addresses.": [
        "Общий образ - это образ диска работающий на любом узле, зарегистрированном в Foreman. Он требует наличие DHCP и DNS служб для функционирования и соединения с сервером, но не требует резервации DHCP или статических IP адресов."
      ],
      "Grub2 directory": [
        ""
      ],
      "Host '%s' image": [
        "Образ узла '%s'"
      ],
      "Host image": [
        "Образ узла"
      ],
      "Host image template": [
        ""
      ],
      "Host images": [
        ""
      ],
      "Host is not in build mode": [
        ""
      ],
      "Host is not in build mode, so the template cannot be rendered": [
        "узел не в режиме сборки, шаблон не может быть применим"
      ],
      "Host is not in build mode.": [
        ""
      ],
      "ISO build failed": [
        "Не удалось создать ISO"
      ],
      "ISO generation command": [
        ""
      ],
      "ISO hybrid conversion failed: %s": [
        ""
      ],
      "ISOLINUX directory": [
        ""
      ],
      "Import Puppet classes": [
        "Импорт классов Puppet"
      ],
      "Import facts": [
        "Импорт фактов"
      ],
      "Installation media caching": [
        ""
      ],
      "Installation media files will be cached for full host images": [
        "Файлы с установочного носителя будут закешированы для полного образа узла."
      ],
      "List of allowed bootdisk types, remove type to disable it": [
        ""
      ],
      "Not available": [
        ""
      ],
      "Once chainloaded, the OS bootloader and installer are downloaded directly from the installation media configured in Foreman, and the provisioning script (kickstart/preseed) is downloaded from Foreman.": [
        "После того как загрузчик ОС и установщик скачаны напрямую с установочного носителя, настроенного в Foreman, и скрипт подготовки (kickstart/preseed) скачан из Foreman."
      ],
      "Path to directory containing grubx64.efi and shimx64.efi": [
        ""
      ],
      "Path to directory containing iPXE images": [
        "Путь к каталогу с образами iPXE"
      ],
      "Path to directory containing isolinux images": [
        ""
      ],
      "Path to directory containing syslinux images": [
        "Путь к каталогу с образами syslinux"
      ],
      "Per-host images contain data about a particular host registered in Foreman and set up fully static networking, avoiding the requirement for DHCP.  After networking is configured, they chainload from Foreman, picking up the current OS configuration and build state from the server.": [
        "Образ для каждого узла содержит данные о конкретном узле, зарегистрированном в Foreman и настроен на статичную сеть, избегающую запросов по DHCP. После настройки сети, с сервера Foreman подтягивается текущая конфигурация ОС и собирается окружение сервера."
      ],
      "Please ensure the ipxe-bootimgs package is installed.": [
        ""
      ],
      "Please ensure the isolinux/syslinux package(s) are installed.": [
        ""
      ],
      "Plugin for Foreman that creates iPXE-based boot disks to provision hosts without the need for PXE infrastructure.": [
        "Дополнение для Foreman, которое создает iPXE-базовые загрузочные диски для подготовленных узлов без использования служб инфраструктуры PXE."
      ],
      "Remote action:": [
        "Удаленное действие:"
      ],
      "SYSLINUX directory": [
        ""
      ],
      "Subnet '%s' generic image": [
        "Стандартный образ для подсети «%s»"
      ],
      "Subnet boot disks": [
        "Загрузочные диски для подсети"
      ],
      "Subnet generic image": [
        ""
      ],
      "Subnet image": [
        "Образ для подсети"
      ],
      "Subnet images are similar to generic images, but chain-loading is done via the TFTP Smart Proxy assigned to the Subnet of the host. The smart proxy must have the \\\"Templates\\\" module enabled and configured.": [
        "Образ для подсети похож на стандартный образ, но отличается от него тем, что цепная загрузка происходит с капсулы TFTP, назначенной подсети, которой принадлежит узел. Для этого на капсуле должно быть установлено и настроено дополнение «Шаблоны»."
      ],
      "TFTP feature not enabled for subnet %s": [
        "TFTP не поддерживается для подсети %s"
      ],
      "The OS install continues using the installation media configured in Foreman, and it will typically configure static networking, depending on how the OS iPXE template is configured.": [
        "Установщик ОС продолжит использовать установочный носитель, настроенный в Foreman, и он будет настраивать статическую сеть, зависящую от того как настроен шаблон iPXE ОС."
      ],
      "These images are more generic than previous images. You can find them at subnet index page.": [
        ""
      ],
      "These images are used for host. You can find them at host detail page.": [
        ""
      ],
      "This image is generic for all hosts with a provisioning NIC on that subnet.": [
        "Этот образ является универсальным для всех узлов в избранной подсети, на которых настроен сетевой адаптер для подготовки узла."
      ],
      "This type of bootdisk is not allowed. Please contact administrator.": [
        ""
      ],
      "True for full, false for basic reusable image": [
        "Истина для полного, ложь для начального образа"
      ],
      "Unable to find template specified by %s setting": [
        "Шаблон из параметра %s не найден"
      ],
      "Unable to generate disk %{kind} template: %{error}": [
        ""
      ],
      "Unable to generate disk template, %{kind} template not found.": [
        ""
      ],
      "Unable to mcopy %{file}": [
        ""
      ],
      "Upload ISO image to datastore for %s": [
        ""
      ],
      "Various types of boot disks can be created to provision hosts without the need for PXE services.  Boot disks can be attached to the host (physical or virtual) which boots from the disk, contacts Foreman and begins the OS installation.": [
        "Типы вариантов загрузочных дисков, которые могут быть созданы для подготовленных узлов без служб PXE. Загрузочные диски могут быть прикреплены к узлу (физическому или виртуальному), который загружается соединяясь с Foreman и начинающих установку ОС."
      ],
      "iPXE directory": [
        ""
      ],
      "iPXE template to use for generic EFI host boot disks": [
        ""
      ],
      "iPXE template to use for generic host boot disks": [
        "Шаблон iPXE стандартного образа"
      ],
      "iPXE template to use for host-specific boot disks": [
        "Шаблон iPXE индивидуального образа"
      ]
    }
  }
};