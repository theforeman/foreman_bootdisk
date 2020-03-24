# frozen_string_literal: true

require File.expand_path('lib/foreman_bootdisk/version', __dir__)

Gem::Specification.new do |s|
  s.name = 'foreman_bootdisk'

  s.version = ForemanBootdisk::VERSION

  s.summary = 'Create boot disks to provision hosts with Foreman'
  # duplicated in locale/gemspec.rb
  s.description = 'Plugin for Foreman that creates iPXE-based boot disks to provision hosts without the need for PXE infrastructure.'
  s.homepage = 'http://github.com/theforeman/foreman_bootdisk'
  s.licenses = ['GPL-3.0']
  s.require_paths = ['lib']

  s.authors = ['Dominic Cleal']
  s.email = 'dcleal@redhat.com'

  s.extra_rdoc_files = [
    'CHANGES.md',
    'LICENSE',
    'README.md'
  ]
  s.files = `git ls-files`.split("\n") - Dir['.*', 'Gem*', '*.gemspec']

  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rubocop-minitest'
  s.add_development_dependency 'rubocop-performance'
  s.add_development_dependency 'rubocop-rails'
  s.add_development_dependency 'webmock'
end
