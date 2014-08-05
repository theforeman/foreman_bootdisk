require File.expand_path('../lib/foreman_bootdisk/version', __FILE__)
require 'date'

Gem::Specification.new do |s|
  s.name = "foreman_bootdisk"

  s.version = ForemanBootdisk::VERSION
  s.date = Date.today.to_s

  s.summary = "Create boot disks to provision hosts with Foreman"
  s.description = "Plugin for Foreman that creates iPXE-based boot disks to provision hosts without the need for PXE infrastructure."
  s.homepage = "http://github.com/theforeman/foreman_bootdisk"
  s.licenses = ["GPL-3"]
  s.require_paths = ["lib"]

  s.authors = ["Dominic Cleal"]
  s.email = "dcleal@redhat.com"

  s.extra_rdoc_files = [
    "CHANGES.md",
    "LICENSE",
    "README.md",
  ]
  s.files = `git ls-files`.split("\n") - Dir[".*", "Gem*", "*.gemspec"]
end
