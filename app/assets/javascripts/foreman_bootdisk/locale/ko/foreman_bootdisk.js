 locales['foreman_bootdisk'] = locales['foreman_bootdisk'] || {}; locales['foreman_bootdisk']['ko'] = {
  "domain": "foreman_bootdisk",
  "locale_data": {
    "foreman_bootdisk": {
      "": {
        "Project-Id-Version": "foreman_bootdisk 21.1.0",
        "Report-Msgid-Bugs-To": "",
        "POT-Creation-Date": "2023-09-18 14:01+0200",
        "PO-Revision-Date": "2014-02-13 12:12+0000",
        "Last-Translator": "FULL NAME <EMAIL@ADDRESS>",
        "Language-Team": "Korean (http://app.transifex.com/foreman/foreman/language/ko/)",
        "MIME-Version": "1.0",
        "Content-Type": "text/plain; charset=UTF-8",
        "Content-Transfer-Encoding": "8bit",
        "Language": "ko",
        "Plural-Forms": "nplurals=1; plural=0;",
        "lang": "ko",
        "domain": "foreman_bootdisk",
        "plural_forms": "nplurals=1; plural=0;"
      },
      "This type of bootdisk is not allowed. Please contact administrator.": [
        ""
      ],
      "Boot disks": [
        "부팅 디스크 "
      ],
      "Download generic image": [
        "일반 이미지 다운로드 "
      ],
      "Download host image": [
        "호스트 이미지 다운로드 "
      ],
      "True for full, false for basic reusable image": [
        "전체 이미지의 경우 True, 다시 사용할 수 있는 기본 이미지의 경우 False"
      ],
      "Host is not in build mode": [
        ""
      ],
      "Subnet boot disks": [
        "서브넷 부팅 디스크"
      ],
      "Download subnet generic image": [
        "서브넷 일반 이미지 다운로드"
      ],
      "TFTP feature not enabled for subnet %s": [
        "%s 서브넷에 대해 TFTP 기능이 활성화되어 있지 않습니다."
      ],
      "Host is not in build mode.": [
        ""
      ],
      "Failed to render boot disk template": [
        "부팅 디스크 템플릿을 렌더링하지 못했습니다."
      ],
      "Host '%s' image": [
        "호스트 '%s' 이미지 "
      ],
      "Full host '%s' image": [
        "전체 호스트 '%s' 이미지 "
      ],
      "Boot disk help": [
        ""
      ],
      "Boot disk Help": [
        ""
      ],
      "Boot disk": [
        "부팅 디스크 "
      ],
      "Boot disk download not available for %s architecture": [
        ""
      ],
      "Subnet '%s' generic image": [
        "'%s' 서브넷 일반 이미지"
      ],
      "Subnet generic image": [
        ""
      ],
      "Generic image": [
        "일반 이미지 "
      ],
      "Unable to find template specified by %s setting": [
        "%s 설정에 의해 지정된 템플릿을 찾을 수 없습니다 "
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
        "호스트가 빌드 모드가 아니므로 템플릿을 렌더링할 수 없습니다 "
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
        "ISO 빌드 실패 "
      ],
      "ISO hybrid conversion failed: %s": [
        ""
      ],
      "Back": [
        "뒤로 "
      ],
      "Various types of boot disks can be created to provision hosts without the need for PXE services.  Boot disks can be attached to the host (physical or virtual) which boots from the disk, contacts Foreman and begins the OS installation.": [
        "PXE 서비스 없이 호스트 프로비저닝을 수행하기 위해 다양한 유형의 부팅 디스크를 생성할 수 있습니다. 부팅 디스크는 디스크에서 부팅하여 Foreman과 통신 후 OS 설치를 시작하는 호스트 (물리 또는 가상)에 할당할 수 있습니다. "
      ],
      "All images are usable as either ISOs or as disk images, including being written to a USB disk with `dd`.": [
        "모든 이미지는 `dd`로 USB 디스크에 기록되는 것을 포함하여 ISO 또는 디스크 이미지 중 하나로 사용할 수 있습니다. "
      ],
      "Host images": [
        ""
      ],
      "These images are used for host. You can find them at host detail page.": [
        ""
      ],
      "Host image": [
        "호스트 이미지 "
      ],
      "Per-host images contain data about a particular host registered in Foreman and set up fully static networking, avoiding the requirement for DHCP.  After networking is configured, they chainload from Foreman, picking up the current OS configuration and build state from the server.": [
        "호스트 당 이미지에는 Foreman에 등록된 특정 호스트에 대한 데이터가 포함되어 있으며 DHCP 요구 사항을 제거하여 완전하게 정적인 네트워크가 설정되어 있습니다. 네트워크 설정 후 Foreman에서 체인로드를 수행하여 현재 OS 설정 및 빌드 상태가 서버에서 검색됩니다."
      ],
      "Once chainloaded, the OS bootloader and installer are downloaded directly from the installation media configured in Foreman, and the provisioning script (kickstart/preseed) is downloaded from Foreman.": [
        "체인 로드가 실행되면 OS 부트로더 및 설치 프로그램은 Foreman에서 설정된 설치 미디어에서 직접 다운로드되고 프로비저닝 스크립트 (kickstart/preseed)는 Foreman에서 다운로드됩니다. "
      ],
      "Full host image": [
        "전체 호스트 이미지 "
      ],
      "A variant of the per-host image which contains the OS bootloader embedded inside the disk.  This may be useful if chainloading fails on certain hardware, but has the downside that the image must be regenerated for any change in the OS, bootloader or PXELinux templates.": [
        "디스크 내부에 내장된 OS 부트로더를 포함하는 호스트별 이미지의 변형입니다. 특정 하드웨어에서 체인로딩이 실패할 경우 유용할 수 있지만 OS, 부트로더 또는 PXELinux 템플릿이 변경될 때마다 이미지를 다시 생성해야 한다는 단점이 있습니다."
      ],
      "Generic images": [
        ""
      ],
      "These images are more generic than previous images. You can find them at subnet index page.": [
        ""
      ],
      "Generic images are a reusable disk image that works for any host registered in Foreman.  It requires a basic DHCP and DNS service to function and contact the server, but does not require DHCP reservations or static IP addresses.": [
        "일반 이미지는 Foreman에 등록된 모든 호스트에서 작동하는 다시 사용 가능한 디스크 이미지입니다. 이를 사용하려면 기본  DHCP 및 DNS 서비스가 작동하고 서버와 통신할 수 있어야 하지만 DHCP 예약 기능 및 고정 IP 주소는 필요하지 않습니다.  "
      ],
      "The OS install continues using the installation media configured in Foreman, and it will typically configure static networking, depending on how the OS iPXE template is configured.": [
        "OS 설치는 Foreman에 설정된 설치 미디어를 계속 사용하며 OS iPXE 템플릿의 설정 방법에 따라 일반적으로 정적 네트워크를 설정합니다. "
      ],
      "Subnet image": [
        "서브넷 이미지"
      ],
      "Subnet images are similar to generic images, but chain-loading is done via the TFTP Smart Proxy assigned to the Subnet of the host. The smart proxy must have the \\\"Templates\\\" module enabled and configured.": [
        "서브넷 이미지는 일반 이미지와 유사하지만 체인로딩이 호스트의 서브넷에 할당된 TFTP 스마트 프록시를 통해 수행됩니다. 스마트 프록시에는 \\\"템플릿\\\" 모듈이 활성화되고 구성되어 있어야 합니다."
      ],
      "This image is generic for all hosts with a provisioning NIC on that subnet.": [
        "이 이미지는 해당 서브넷에 프로비저닝 NIC가 있는 모든 호스트에 공통적으로 사용됩니다."
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
        "iPXE 이미지가 들어있는 디렉토리로의 경로 "
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
        "syslinux 이미지가 들어있는 디렉토리로의 경로 "
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
        "호스트별 부팅 디스크 용으로 사용할 iPXE 템플릿 "
      ],
      "Generic image template": [
        ""
      ],
      "iPXE template to use for generic host boot disks": [
        "일반 호스트 부팅 디스크 용으로 사용할 iPXE 템플릿 "
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
        "ISO 이미지를 생성하기 위한 명령, genisoimage 또는 mkisofs 사용 "
      ],
      "Installation media caching": [
        ""
      ],
      "Installation media files will be cached for full host images": [
        "설치 미디어 파일은 전체 호스트 이미지에 캐시됩니다 "
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
        "원격 작업:"
      ],
      "Import Puppet classes": [
        "Puppet 클래스 가져오기"
      ],
      "Import facts": [
        "팩트 불러오기"
      ],
      "Action with sub plans": [
        "하위 계획이 있는 작업"
      ],
      "Plugin for Foreman that creates iPXE-based boot disks to provision hosts without the need for PXE infrastructure.": [
        "PXE 인프라없이 호스트 프로비저닝을 실행하기 위해 iPXE 기반 부트 디스크를 생성하는 Foreman 플러그인입니다."
      ]
    }
  }
};