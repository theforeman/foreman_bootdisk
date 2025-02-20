 locales['foreman_bootdisk'] = locales['foreman_bootdisk'] || {}; locales['foreman_bootdisk']['ja'] = {
  "domain": "foreman_bootdisk",
  "locale_data": {
    "foreman_bootdisk": {
      "": {
        "Project-Id-Version": "foreman_bootdisk 22.0.2",
        "Report-Msgid-Bugs-To": "",
        "PO-Revision-Date": "2014-02-13 12:12+0000",
        "Last-Translator": "山田 修司 🍣 Shuji Yamada <uzy.exe@gmail.com>, 2015",
        "Language-Team": "Japanese (http://app.transifex.com/foreman/foreman/language/ja/)",
        "MIME-Version": "1.0",
        "Content-Type": "text/plain; charset=UTF-8",
        "Content-Transfer-Encoding": "8bit",
        "Language": "ja",
        "Plural-Forms": "nplurals=1; plural=0;",
        "lang": "ja",
        "domain": "foreman_bootdisk",
        "plural_forms": "nplurals=1; plural=0;"
      },
      "* - These bootdisk types were disabled, you can enable them in Administer - Settings.": [
        "* - これらのブートディスクタイプは無効にされています。管理 - 設定 で有効にすることができます。"
      ],
      "A variant of the per-host image which contains the OS bootloader embedded inside the disk.  This may be useful if chainloading fails on certain hardware, but has the downside that the image must be regenerated for any change in the OS, bootloader or PXELinux templates.": [
        "OS ブートローダーがディスク内に組み込まれているホスト別イメージのバリアントです。これは、特定のハードウェアでチェーンロードが失敗した場合に役立ちますが、不利な点として、OS、ブートローダーまたは PXELinux テンプレートに変更がある場合はイメージを再生成する必要があります。"
      ],
      "All images are usable as either ISOs or as disk images, including being written to a USB disk with `dd`.": [
        "すべてのイメージは、`dd` で USB ディスクに書き込まれるものを含め、ISO またはディスクイメージのいずれかとして利用することができます。"
      ],
      "Allowed bootdisk types": [
        "許可されるブートディスクのタイプ"
      ],
      "Attach ISO image to CDROM drive for %s": [
        "ISO イメージの %s の CDROM ドライブへの割り当て"
      ],
      "Back": [
        "戻る"
      ],
      "Boot disk": [
        "ブートディスク"
      ],
      "Boot disk Help": [
        "ブートディスクヘルプ"
      ],
      "Boot disk based": [
        "ブートディスクベース"
      ],
      "Boot disk download not available for %s architecture": [
        "ブートディスクのダウンロードは %s アーキテクチャーには使用できません"
      ],
      "Boot disk help": [
        "ブートディスクヘルプ"
      ],
      "Boot disks": [
        "ブートディスク"
      ],
      "Command to generate ISO image, use genisoimage or mkisofs": [
        "ISO イメージを生成するためのコマンドです。genisoimage または mkisofs を使用します"
      ],
      "Creating new image failed, install truncate utility": [
        "新しいイメージの作成に失敗しました。truncate ユーティリティーをインストールしてください"
      ],
      "Detach ISO image from CDROM drive for %s": [
        "%s の CDROM ドライブから ISO イメージをデタッチ"
      ],
      "Download generic image": [
        "汎用イメージをダウンロード"
      ],
      "Download host image": [
        "ホストイメージをダウンロード"
      ],
      "Download subnet generic image": [
        "サブネットの汎用イメージのダウンロード"
      ],
      "Ensure %{file} is readable (or update \\\"Grub2 directory\\\" setting)": [
        "%{file} が読み取り可能であることを確認します (または「Grub2 ディレクトリー」設定を更新します)"
      ],
      "Failed to attach ISO image to CDROM drive of instance %{name}: %{message}": [
        "インスタンス %{name} の CDROM ドライブへの ISO イメージの割り当てに失敗しました: %{message}"
      ],
      "Failed to create a directory within the ESP image": [
        "ESP のイメージ内にディレクトリーを作成できませんでした"
      ],
      "Failed to detach ISO image from CDROM drive of instance %{name}: %{message}": [
        "インスタンス %{name} の CDROM ドライブから ISO イメージのデタッチに失敗しました: %{message}"
      ],
      "Failed to format the ESP image via mkfs.msdos": [
        "mkfs.msdos で ESPイメージをフォーマットできませんでした"
      ],
      "Failed to generate ISO image for instance %{name}: %{message}": [
        "インスタンス %{name} の ISO イメージの生成に失敗しました: %{message}"
      ],
      "Failed to render boot disk template": [
        "ブートディスクテンプレートのレンダリングに失敗しました"
      ],
      "Failed to upload ISO image for instance %{name}: %{message}": [
        "インスタンス %{name} の ISO イメージのアップロードに失敗しました: %{message}"
      ],
      "Full host '%s' image": [
        "完全ホスト '%s' イメージ"
      ],
      "Full host image": [
        "完全ホストイメージ"
      ],
      "Generating ISO image for %s": [
        "%s の ISO イメージを生成中"
      ],
      "Generic Grub2 EFI image template": [
        "Grub2 EFI の汎用イメージテンプレート"
      ],
      "Generic image": [
        "汎用イメージ"
      ],
      "Generic image template": [
        "汎用イメージテンプレート"
      ],
      "Generic images": [
        "汎用イメージ"
      ],
      "Generic images are a reusable disk image that works for any host registered in Foreman.  It requires a basic DHCP and DNS service to function and contact the server, but does not require DHCP reservations or static IP addresses.": [
        "汎用イメージは、Foreman に登録されたすべてのホストで機能する再利用可能なディスクイメージです。これを使用するには、基本的な DHCP および DNS サービスが機能し、サーバーと通信できることが必要になりますが、DHCP 予約や静的 IP アドレスは必要ありません。"
      ],
      "Grub2 directory": [
        "Grub2 ディレクトリー"
      ],
      "Host '%s' image": [
        "ホスト '%s' イメージ"
      ],
      "Host image": [
        "ホストイメージ"
      ],
      "Host image template": [
        "ホストイメージテンプレート"
      ],
      "Host images": [
        "ホストイメージ"
      ],
      "Host is not in build mode": [
        "ホストがビルドモードではありません"
      ],
      "Host is not in build mode, so the template cannot be rendered": [
        "ホストはビルドモードではないため、テンプレートはレンダリングすることができません"
      ],
      "Host is not in build mode.": [
        "ホストがビルドモードではありません。"
      ],
      "ISO build failed": [
        "ISO ビルドに失敗しました"
      ],
      "ISO generation command": [
        "ISO 生成コマンド"
      ],
      "ISO hybrid conversion failed: %s": [
        "ISO ハイブリッド変換に失敗しました: %s"
      ],
      "ISOLINUX directory": [
        "ISOLINUX ディレクトリー"
      ],
      "Installation media caching": [
        "インストールメディアのキャッシング"
      ],
      "Installation media files will be cached for full host images": [
        "インストールメディアファイルは、完全なホストのイメージのためにキャッシュされます"
      ],
      "List of allowed bootdisk types, remove type to disable it": [
        "許可されているブートディスクタイプのリスト、タイプを削除して無効にします"
      ],
      "Not available": [
        "利用できません"
      ],
      "Once chainloaded, the OS bootloader and installer are downloaded directly from the installation media configured in Foreman, and the provisioning script (kickstart/preseed) is downloaded from Foreman.": [
        "チェーンロードが実行されると、OS ブートローダーとインストーラーは Foreman で設定されたインストールメディアから直接ダウンロードされ、プロビジョニングスクリプト (kickstart/preseed) は Foreman からダウンロードされます。"
      ],
      "Path to directory containing grubx64.efi and shimx64.efi": [
        "grubx64.efi および shimx64.efi が含まれるディレクトリーへのパス"
      ],
      "Path to directory containing iPXE images": [
        "iPXE イメージを含むディレクトリーへのパス"
      ],
      "Path to directory containing isolinux images": [
        "isolinux イメージを含むディレクトリーへのパス"
      ],
      "Path to directory containing syslinux images": [
        "syslinux イメージを含むディレクトリーへのパス"
      ],
      "Per-host images contain data about a particular host registered in Foreman and set up fully static networking, avoiding the requirement for DHCP.  After networking is configured, they chainload from Foreman, picking up the current OS configuration and build state from the server.": [
        "ホストごとのイメージには、Foreman に登録された特定ホストについてのデータが含まれ、これは完全に静的なネットワークをセットアップするため、DHCP の要件が排除されます。ネットワークの設定後、Foreman からチェーンロードが実行され、現在の OS 設定やビルド状態の情報がサーバーから取得されます。"
      ],
      "Please ensure the ipxe-bootimgs package is installed.": [
        "ipxe-bootimgs パッケージがインストールされていることを確認してください。"
      ],
      "Please ensure the isolinux/syslinux package(s) are installed.": [
        "isolinux/syslinux パッケージがインストールされていることを確認してください。"
      ],
      "Plugin for Foreman that creates iPXE-based boot disks to provision hosts without the need for PXE infrastructure.": [
        "PXE インストラクチャーなしにホストのプロビジョニングを行うための iPXE ベースのブートディスクを作成する Foreman のプラグインです。"
      ],
      "SYSLINUX directory": [
        "SYSLINUX ディレクトリー"
      ],
      "Subnet '%s' generic image": [
        "サブネット '%s' の汎用イメージ"
      ],
      "Subnet boot disks": [
        "サブネットブートディスク"
      ],
      "Subnet generic image": [
        "サブネットの汎用イメージ"
      ],
      "Subnet image": [
        "サブネットイメージ"
      ],
      "Subnet images are similar to generic images, but chain-loading is done via the TFTP Smart Proxy assigned to the Subnet of the host. The smart proxy must have the \\\"Templates\\\" module enabled and configured.": [
        "サブネットイメージは汎用イメージに似ていますが、チェーンロードは、ホストのサブネットに割り当てられる TFTP スマートプロキシーで実行されます。スマートプロキシーでは「テンプレート」を有効にし、設定する必要があります。"
      ],
      "TFTP feature not enabled for subnet %s": [
        "TFTP 機能がサブネット %s に対して有効にされていません"
      ],
      "The OS install continues using the installation media configured in Foreman, and it will typically configure static networking, depending on how the OS iPXE template is configured.": [
        "OS インストールは、Foreman で設定されたインストールメディアの使用を継続します。さらに、OS iPXE テンプレートの設定方法によりますが、通常は静的ネットワークを設定します。"
      ],
      "These images are more generic than previous images. You can find them at subnet index page.": [
        "これらのイメージは、以前のイメージよりも汎用的です。これらはサブネットインデックスページで見つけることができます。"
      ],
      "These images are used for host. You can find them at host detail page.": [
        "これらのイメージはホストに使用されます。ホストの詳細ページでそれらを見つけることができます。"
      ],
      "This image is generic for all hosts with a provisioning NIC on that subnet.": [
        "このイメージは、サブネットにプロビジョニング NIC が設定されたすべてのホストに対して汎用性があります。"
      ],
      "This type of bootdisk is not allowed. Please contact administrator.": [
        "このタイプのブートディスクは許可されていません。管理者に連絡してください。"
      ],
      "True for full, false for basic reusable image": [
        "完全イメージの場合は true、基本的な再利用可能イメージの場合は false"
      ],
      "Unable to find template specified by %s setting": [
        "%s 設定で指定されているテンプレートが見つかりません"
      ],
      "Unable to generate disk %{kind} template: %{error}": [
        "ディスクの %{kind} テンプレートを生成できません: %{error}"
      ],
      "Unable to generate disk template, %{kind} template not found.": [
        "ディスクテンプレートを生成できません。%{kind} テンプレートが見つかりません。"
      ],
      "Unable to mcopy %{file}": [
        "%{file} を mcopy できません"
      ],
      "Upload ISO image to datastore for %s": [
        "ISO イメージの %s のデータストアへのアップロード"
      ],
      "Various types of boot disks can be created to provision hosts without the need for PXE services.  Boot disks can be attached to the host (physical or virtual) which boots from the disk, contacts Foreman and begins the OS installation.": [
        "さまざまなタイプのブートディスクを作成して、PXE サービスなしにホストのプロビジョニングを実行できます。ブートディスクは、ディスクから起動し、Foreman と通信して OS インストールを開始するホスト (物理または仮想) に割り当てることができます。"
      ],
      "iPXE directory": [
        "iPXE ディレクトリー"
      ],
      "iPXE template to use for generic EFI host boot disks": [
        "汎用の EFI ホストブートディスクに使用する iPXE テンプレート"
      ],
      "iPXE template to use for generic host boot disks": [
        "汎用のホストブートディスクに使用する iPXE テンプレート"
      ],
      "iPXE template to use for host-specific boot disks": [
        "ホスト固有のブートディスクに使用する iPXE テンプレート"
      ]
    }
  }
};