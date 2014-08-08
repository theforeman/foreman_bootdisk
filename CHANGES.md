# Changelog

## v3.1.0
* added API:
    * /bootdisk/api/v2/generic to download the generic ISO
    * /bootdisk/api/v2/hosts/:id to download the per-host ISO
* refactored plugin to be an isolated engine

## v3.0.0
* modernised to use Foreman 1.6 features, no new functionality
* use template locking mechanism from Foreman 1.6 (#6843, Stephen Benjamin)
* use seeds.d mechanism instead of extending db:seed
* add de, es, fr, pt_BR, sv_SE translations (thanks to the translator teams)

## v2.0.8
* fix DB migration when setting when using empty database (#5970)
* updates to README

## v2.0.7
* change 'kind' of templates to Bootdisk to avoid confusion

## v2.0.6
* fix deletion of non-bootdisk config templates

## v2.0.5
* safemode compatibility under Foreman 1.5

## v2.0.4
* fix Foreman 1.5 host show page compatibility
* updates to README

## v2.0.3
* fix Foreman 1.5 auth system compatibility (#4893)
* fix filename of generic ISO image in rake task

## v2.0.2
* add MAC address to iPXE chain request for NAT (#3562, Jon Fautley)
* raise friendly error if safemode is enabled (#4184, #2948)
* add i18n framework and en_GB translation (#3981)
* fix filename of generic ISO image
* fix template deletion blocking
* update instructions for Debian

## v2.0.1
* use genisoimage instead of mkisofs by default, added setting to control
* fix translation extraction of setting descriptions

## v2.0.0
* compatible with Foreman 1.4 (only), uses new plugin registration system
* add validation of host and subnet data to host template
* remove kickstart iPXE, use the one supplied in Foreman 1.4

## v1.2.3
* remove secondary DNS server from iPXE template (#3558)

## v1.2.2
* check ipxe/syslinux are present when generating images (#3195)
* fix RHN_PROVISIONING_MAC_0 error on template retrieval

## v1.2.1
* add permission and default role for non-admin users
* fix DB migration from clean install

## v1.2.0
* add generic image, relying on DHCP and a MAC/IP search
* fix inability to associate provided templates with OSes

## v1.1.0
* per-host USB image support using isohybrid
* templates updated for multi-NIC support
* Ruby 1.8.7 fixes

## v1.0.0
* initial release
* per-host ISO image support
