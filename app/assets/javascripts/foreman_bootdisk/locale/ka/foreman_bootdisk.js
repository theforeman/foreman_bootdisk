 locales['foreman_bootdisk'] = locales['foreman_bootdisk'] || {}; locales['foreman_bootdisk']['ka'] = {
  "domain": "foreman_bootdisk",
  "locale_data": {
    "foreman_bootdisk": {
      "": {
        "Project-Id-Version": "foreman_bootdisk 21.1.0",
        "Report-Msgid-Bugs-To": "",
        "PO-Revision-Date": "2014-02-13 12:12+0000",
        "Last-Translator": "FULL NAME <EMAIL@ADDRESS>",
        "Language-Team": "Georgian (http://app.transifex.com/foreman/foreman/language/ka/)",
        "MIME-Version": "1.0",
        "Content-Type": "text/plain; charset=UTF-8",
        "Content-Transfer-Encoding": "8bit",
        "Language": "ka",
        "Plural-Forms": "nplurals=2; plural=(n!=1);",
        "lang": "ka",
        "domain": "foreman_bootdisk",
        "plural_forms": "nplurals=2; plural=(n!=1);"
      },
      "This type of bootdisk is not allowed. Please contact administrator.": [
        "ჩატვირთვადი დისკი მხარდაუჭერელია. დაუკავშირდით ადმინისტრატორს."
      ],
      "Boot disks": [
        "ჩატვირთვადი დისკები"
      ],
      "Download generic image": [
        "ზოგადი ასლის გადმოწერა"
      ],
      "Download host image": [
        "ჰოსტის ასლის გადმოწერა"
      ],
      "True for full, false for basic reusable image": [
        "ჩართეთ სრული, გამორთეთ მრავალჯერადი ასლისთვის"
      ],
      "Host is not in build mode": [
        "ჰოსტის აგების რეჟიმში არაა"
      ],
      "Subnet boot disks": [
        "ქვექსელის ჩატვირთვადი დისკი"
      ],
      "Download subnet generic image": [
        "ქვექსელის ჩატვირთვადი დისკის გადმოწერა"
      ],
      "TFTP feature not enabled for subnet %s": [
        "ქვექსელისთვის %s TFTP ჩართული არაა"
      ],
      "Host is not in build mode.": [
        "ჰოსტის აგების რეჟიმში არაა."
      ],
      "Failed to render boot disk template": [
        "ჩატვირთვადი დისკის შაბლონის რენდერის შეცდომა"
      ],
      "Host '%s' image": [
        "ჰოსტის %s ასლი"
      ],
      "Full host '%s' image": [
        "ჰოსტსის სრული %s ასლი"
      ],
      "Boot disk help": [
        "ჩატვირთვადი დისკის დახმარება"
      ],
      "Boot disk Help": [
        "ჩატვირთვადი დისკის დახმარება"
      ],
      "Boot disk": [
        "ჩატვირთვადი დისკი"
      ],
      "Boot disk download not available for %s architecture": [
        "ჩატვირთვადი დისკის გადმოწერა მიუწვდომელია არქიტექტურისთვის: %s"
      ],
      "Subnet '%s' generic image": [
        "ქვექსელის %s ზოგადი ასლის გადმოწერა"
      ],
      "Subnet generic image": [
        "ქვექსელის ზოგადი ასლი"
      ],
      "Generic image": [
        "ზოგადი ასლი"
      ],
      "Unable to find template specified by %s setting": [
        "%s პარამეტრით მითითებული შაბლონის პოვნა შეუძლებელია"
      ],
      "Generating ISO image for %s": [
        "%s-სთვის ISO ასლის გენერაცია"
      ],
      "Upload ISO image to datastore for %s": [
        "%s-სთვის ISO ასლის საცავზე ატვირთვა"
      ],
      "Attach ISO image to CDROM drive for %s": [
        "%s-სთვის ISO ასლის CDROM წამყვანზე მიბმა"
      ],
      "Detach ISO image from CDROM drive for %s": [
        "%s-სთვის ISO-ი ასლის CDROM-ი წამყვანიდან მოხსნა"
      ],
      "Failed to generate ISO image for instance %{name}: %{message}": [
        "ISO ფაილის შექმნის შეცდომა %{name}-სთვის: %{message}"
      ],
      "Failed to upload ISO image for instance %{name}: %{message}": [
        "ISO ფაილის ატვირთვის შეცდომა %{name}-სთვის: %{message}"
      ],
      "Failed to attach ISO image to CDROM drive of instance %{name}: %{message}": [
        "ISO ასლის CDROM-ში ჩადების შეცდომა %{name}-სთვის: %{message}"
      ],
      "Failed to detach ISO image from CDROM drive of instance %{name}: %{message}": [
        "ISO ასლის CDROM-დან გამოღების შეცდომა %{name}-სთვის: %{message}"
      ],
      "Host is not in build mode, so the template cannot be rendered": [
        "ჰოსტი აგებს რეჟიმში არაა, ამიტომ შაბლონის რენდერი შეუძლებელია"
      ],
      "Unable to generate disk template, %{kind} template not found.": [
        "დისკის შაბლონის გენერაციის პრობლემა. შაბლონი %{kind} არ არსებობს."
      ],
      "Unable to generate disk %{kind} template: %{error}": [
        "დისკის %{kind} შაბლონის %{error} გენერაციის შეცდომა"
      ],
      "Please ensure the isolinux/syslinux package(s) are installed.": [
        "დარწმუნდით, რომ isolnux/syslinux-ის პაკეტები დაყენებულია."
      ],
      "Please ensure the ipxe-bootimgs package is installed.": [
        "დარწმუნდით, რომ ipxe-bootimgs პაკეტი დაყენებულია."
      ],
      "Creating new image failed, install truncate utility": [
        "ახალი ასლის შექმნის შეცდომა. დააყენეთ პროგრამა truncate"
      ],
      "Failed to format the ESP image via mkfs.msdos": [
        "ESP ასლის mkfs.msdos-ით დაფორმატების შეცოა"
      ],
      "Failed to create a directory within the ESP image": [
        "ESP ასლში საქაღალდის შექმნის შეცდომა"
      ],
      "Ensure %{file} is readable (or update \\\"Grub2 directory\\\" setting)": [
        "დარწმუნდით, რომ %{file} კითხვადია (ან განაახლეთ პარამეტრი \\\"Grub2-ის საქაღალდე\\\")"
      ],
      "Unable to mcopy %{file}": [
        "%{file}-ის mcropy შეუძლებელია"
      ],
      "ISO build failed": [
        "ISO-ის აგების შეცდომა"
      ],
      "ISO hybrid conversion failed: %s": [
        "ISO-ის ჰიბრიდული გარდაქმნის პრობლემა: %s"
      ],
      "Back": [
        "უკან"
      ],
      "Various types of boot disks can be created to provision hosts without the need for PXE services.  Boot disks can be attached to the host (physical or virtual) which boots from the disk, contacts Foreman and begins the OS installation.": [
        "სხვადასხვა ტიპის ჩატვირთვის დისკები შეიძლება შეიქმნას ჰოსტების სამუშაოდ მოსამზადებლად PXE სერვისების გარეშე. ჩატვირთვის დისკები შეიძლება მიმაგრდეს ჰოსტზე (ფიზიკური ან ვირტუალური), რომელიც იტვირთება დისკიდან, დაუკავშირდება Foreman-ს და იწყებს OS-ის ინსტალაციას."
      ],
      "All images are usable as either ISOs or as disk images, including being written to a USB disk with `dd`.": [
        "ყველა ასლი გამოყენებადია, როგორც ISO ან როგორც დისკის ასლი. მათ შორის ჩაწერილი USB დისკზე `dd`-ით."
      ],
      "Host images": [
        "ჰოსტის ასლები"
      ],
      "These images are used for host. You can find them at host detail page.": [
        "ეს ასლები ჰოსტისთვის გამოიყენება. მათი პოვნა ჰოსტის დეტალების გვერდზე შეგიძლიათ."
      ],
      "Host image": [
        "ჰოსტის ასლი"
      ],
      "Per-host images contain data about a particular host registered in Foreman and set up fully static networking, avoiding the requirement for DHCP.  After networking is configured, they chainload from Foreman, picking up the current OS configuration and build state from the server.": [
        "თითოული ჰოსტის ასლი შეიცავს მონაცემებს კონკრეტული ჰოსტის შესახებ, რომელიც რეგისტრირებულია Foreman-ში და დაყენებულია სრულად სტატიკური ქსელის პარამეტრები, DHCP-ის თავიდან ასაცილებლად.   ქსელის კონფიგურაციის შემდეგ, ისინი იტვირთება Foreman-დან, იღებენ OS-ის მიმდინარე კონფიგურაციას და ქმნიან მდგომარეობას სერვერიდან."
      ],
      "Once chainloaded, the OS bootloader and installer are downloaded directly from the installation media configured in Foreman, and the provisioning script (kickstart/preseed) is downloaded from Foreman.": [
        "საწყისი ჩატვირთვის შემდეგ, OS-ის ჩამტვირთველი და ინსტალერი ჩამოიტვირთება უშუალოდ Foreman-ში მორგებული საინსტალაციო მედიიდან, ხოლო უზრუნველყოფის სკრიპტი (kickstart/preseed) ჩამოიტვირთება Foreman-დან."
      ],
      "Full host image": [
        "ჰოსტის სრული ასლი"
      ],
      "A variant of the per-host image which contains the OS bootloader embedded inside the disk.  This may be useful if chainloading fails on certain hardware, but has the downside that the image must be regenerated for any change in the OS, bootloader or PXELinux templates.": [
        "თითო ჰოსტის ასლის ვარიანტი, რომელიც შეიცავს დისკზე ჩაშენებულ OS-ის ჩამტვირთველს. ეს შეიძლება იყოს სასარგებლო, თუ საწყისი ჩატვირთვა ვერ ხერხდება გარკვეულ აპარატურაზე, მაგრამ აქვს უარყოფითი მხარე, რომ ასლი OS, bootloader ან PXELinux შაბლონების ნებისმიერი ცვლილებისას თავიდან უნდა იყოს რეგენერირებული."
      ],
      "Generic images": [
        "ზოგადი ასლი"
      ],
      "These images are more generic than previous images. You can find them at subnet index page.": [
        "ეს ასლები უფრო ზოგადია, ვიდრე ძველი ასლები. ისინი ქვექსელის ინდექსის გვერდზე შეგიძლიათ იპოვოთ."
      ],
      "Generic images are a reusable disk image that works for any host registered in Foreman.  It requires a basic DHCP and DNS service to function and contact the server, but does not require DHCP reservations or static IP addresses.": [
        "ზოგადი ასლები წარმოადგენენ დისკის მრავალჯერად ასლს, რომელიც მუშაობს Foreman-ში რეგისტრირებული ნებისმიერი ჰოსტისთვის. მას ფუნქციონირებისთვის უბრალო DHCP და DNS სერვისები სჭირდება სერვერთან დასაკავშირებლად, მაგრამ არ საჭიროებს DHCP დაჯავშნას ან სტატიკური IP მისამართებს."
      ],
      "The OS install continues using the installation media configured in Foreman, and it will typically configure static networking, depending on how the OS iPXE template is configured.": [
        "ოს-ის დაყენება გრძელდება Foreman-ში მორგებული დასაყენებელი მედიის გამოყენებით და ის ჩვეულებრივ აკონფიგურირებს სტატიკური ქსელს, იმისდა მიხედვით, თუ როგორ არის მორგებული OS iPXE შაბლონი."
      ],
      "Subnet image": [
        "ქვექსელის ასლი"
      ],
      "Subnet images are similar to generic images, but chain-loading is done via the TFTP Smart Proxy assigned to the Subnet of the host. The smart proxy must have the \\\"Templates\\\" module enabled and configured.": [
        "ქვექსელის ასლები მსგავსია ზოგადი ასლების, მაგრამ საწყისი ჩატვირთვა ხდება TFTP Smart Proxy-ის მეშვეობით, რომელიც მინიჭებულია ჰოსტის ქვექსელზე. ჭკვიან პროქსის უნდა ჰქონდეს ჩართული და მორგებული მოდული „შაბლონები“."
      ],
      "This image is generic for all hosts with a provisioning NIC on that subnet.": [
        "ეს ასლი საერთოა ამ ქვექსელის ყველა სამუშაოდ მომზადების ინტერფეისის მქონე ჰოსტებისთვის."
      ],
      "* - These bootdisk types were disabled, you can enable them in Administer - Settings.": [
        "* - ეს ჩატვირთვადი დისკის ეს ტიპები გათიშულია. მათი ჩართვისთვის გადადით \\\"ადმინისტრირება - მორგება\\\"."
      ],
      "Boot disk based": [
        "ჩატვირთვადი დისკი ბაზირებულია"
      ],
      "iPXE directory": [
        "iPXE საქაღალდე"
      ],
      "Path to directory containing iPXE images": [
        "ბილიკი iPXE-ის ასლების შემცველ საქაღალდემდე"
      ],
      "ISOLINUX directory": [
        "ISOLINUX საქაღალდე"
      ],
      "Path to directory containing isolinux images": [
        "ბილიკი isolinux-ის ასლების შემცველ საქაღალდემდე"
      ],
      "SYSLINUX directory": [
        "SYSLINUX საქაღალდე"
      ],
      "Path to directory containing syslinux images": [
        "ბილიკი syslinux-ის ასლების შემცველ საქაღალდემდე"
      ],
      "Grub2 directory": [
        "Grub2 საქაღალდე"
      ],
      "Path to directory containing grubx64.efi and shimx64.efi": [
        "ბილიკი grubx64.efi-ისდა shimx64.efi ფაილების შემცველ საქაღალდემდე"
      ],
      "Host image template": [
        "ჰოსტის ასლის შაბლონი"
      ],
      "iPXE template to use for host-specific boot disks": [
        "iPXE შაბლონი მომხმარებლის მიერ მითითებული ჩატვირთვადი დისკებისთვის"
      ],
      "Generic image template": [
        "ზოგადი ასლის შაბლონი"
      ],
      "iPXE template to use for generic host boot disks": [
        "ჰოსტის ჩატვირთვადი დისკებსისთვის გამოსაყენებელი iPXE შაბლონი"
      ],
      "Generic Grub2 EFI image template": [
        "Grub2 EFI ზოგადი ასლის შაბლონი"
      ],
      "iPXE template to use for generic EFI host boot disks": [
        "ზოგადი EFI ჰოსტის ჩამტვირთავი დისკებისთვის გამოყენებული iPXE-ის შაბლონი"
      ],
      "ISO generation command": [
        "ISO-ის გენერაციის ბრძანება"
      ],
      "Command to generate ISO image, use genisoimage or mkisofs": [
        "ISO ასლის შექმნის ბრძანება. genisoimage ან mkisofs"
      ],
      "Installation media caching": [
        "დასაყენებელი დისკის კეში"
      ],
      "Installation media files will be cached for full host images": [
        "ინსტალაციის ფაილები დაქეშილი იქნება ჰოსტის სრული ასლებისთვის"
      ],
      "Allowed bootdisk types": [
        "ჩატვირთვადი დისკის დაშვებული ტიპები"
      ],
      "List of allowed bootdisk types, remove type to disable it": [
        "ჩატვირთვადი დისკების ნებადართული ტიპები. გამოსართავად უბრალოდ წაშალეთ ის"
      ],
      "Not available": [
        "ხელმიუწვდომელია"
      ],
      "Remote action:": [
        "დაშორებული ქმედება:"
      ],
      "Import Puppet classes": [
        "Puppet-ის კლასების შემოტანა"
      ],
      "Import facts": [
        "ფაქტების შემოტანა"
      ],
      "Action with sub plans": [
        "ქმედება ქვე-გეგმებით"
      ],
      "Plugin for Foreman that creates iPXE-based boot disks to provision hosts without the need for PXE infrastructure.": [
        "Foreman-ის დამატება, რომელიც ქმნის iPXE-ზე დაფუძნებულ ჩატვირთვად დისკებს ჰოსტების სამუშაოდ PXE ინფრასტრუქტურის გარეშე მოსამზადებლად."
      ]
    }
  }
};