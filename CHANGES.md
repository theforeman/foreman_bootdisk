# Changelog

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
