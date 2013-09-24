# encoding: utf-8

require 'rubygems'
require 'rake'
require 'fileutils'

task :default => :test

PLUGIN_NAME = "bootdisk"
ENGINE_DIR = File.expand_path('..', __FILE__)
FOREMAN_DIR = '.foreman_app'

ENV['TEXTDOMAIN'] = PLUGIN_NAME
import "#{FOREMAN_DIR}/Rakefile" if File.exists? "#{FOREMAN_DIR}/Rakefile"

namespace :setup do
  desc "Download latest foreman core devel source and install dependencies"
  task :foreman_prepare do
    foreman_repo = 'https://github.com/theforeman/foreman.git'
    foreman_gemfile = File.join(FOREMAN_DIR, "Gemfile")
    unless File.exists?(foreman_gemfile)
      puts "Foreman source code is not present at #{FOREMAN_DIR}"
      puts "Downloading latest Foreman development branch into #{FOREMAN_DIR}..."
      FileUtils.mkdir_p(FOREMAN_DIR)

      unless system("git clone --depth 1 #{foreman_repo} #{FOREMAN_DIR}")
        puts "Error while getting latest Foreman code from #{foreman_repo} into #{FOREMAN_DIR}"
        fail
      end
    end

    settings_file = "#{FOREMAN_DIR}/config/settings.yaml"
    unless File.exists?(settings_file)
      puts 'Preparing settings file'
      FileUtils.copy("#{settings_file}.example", settings_file)
    end

    db_file = "#{FOREMAN_DIR}/config/database.yml"
    unless File.exists?(db_file)
      puts 'Preparing database file'
      FileUtils.copy("#{db_file}.example", db_file)
    end

    ["#{ENGINE_DIR}/.bundle/config", "#{FOREMAN_DIR}/.bundle/config"].each do |bundle_file|
      unless File.exists?(bundle_file)
        FileUtils.mkdir_p(File.dirname(bundle_file))
        puts 'Preparing bundler configuration'
        File.open(bundle_file, 'w') { |f| f << <<FILE }
---
BUNDLE_WITHOUT: console:development:fog:gce:jsonp:libvirt:mysql:mysql2:ovirt:postgresql:vmware
FILE
      end
    end

    local_gemfile = "#{FOREMAN_DIR}/bundler.d/Gemfile.local.rb"
    unless File.exist?(local_gemfile)
      File.open(local_gemfile, 'w') { |f| f << <<GEMFILE }
gem "facter"
GEMFILE
    end

    puts 'Installing dependencies...'
    unless system('bundle install')
      fail
    end
  end

  task :db_prepare do
    unless File.exists?(FOREMAN_DIR)
      puts <<MESSAGE
Foreman source code not prepared. Run

  rake setup:foreman_prepare

to download foreman source and its dependencies
MESSAGE
      fail
    end

    # once we are Ruby19 only, switch to block variant of cd
    pwd = FileUtils.pwd
    FileUtils.cd(FOREMAN_DIR)
    unless system('bundle exec rake db:test:prepare RAILS_ENV=test')
      puts "Migrating database first"
      system('bundle exec rake db:migrate db:schema:dump') || fail
    end
    FileUtils.cd(pwd)
  end

  task :all => [:foreman_prepare, :db_prepare]
end

namespace :test do
  task :set_loadpath do
    %w[lib test].each do |dir|
      $:.unshift(File.expand_path(dir, ENGINE_DIR))
    end
  end

  task :all => ['setup:db_prepare', 'test:set_loadpath'] do
    Dir.glob('test/**/*_test.rb') { |f| require f.sub('test/','') unless f.include? '.foreman_app/' }
  end
end

task :test => 'test:all'
