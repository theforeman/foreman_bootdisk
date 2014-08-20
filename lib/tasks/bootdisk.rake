require 'date'

namespace :bootdisk do
  namespace :generate do
    desc 'Generate a static boot disk for a specific host.  NAME=fqdn, OUTPUT path'
    task :host => :environment do
      host = Host::Base.find_by_name(ENV['NAME']) || raise("cannot find host '#{ENV['NAME']}', specify NAME=fqdn")
      tmpl = host.bootdisk_template_render

      ForemanBootdisk::ISOGenerator.generate(:ipxe => tmpl) do |image|
        output = ENV['OUTPUT'] || "#{host.name}.iso"
        FileUtils.cp image, output
        puts "Wrote #{output}"
      end
    end

    desc 'Generate a full boot disk for a specific host with the OS bootloader included.  NAME=fqdn, OUTPUT path'
    task :full_host => :environment do
      host = Host::Base.find_by_name(ENV['NAME']) || raise("cannot find host '#{ENV['NAME']}', specify NAME=fqdn")
      ForemanBootdisk::ISOGenerator.generate_full_host(host) do |image|
        output = ENV['OUTPUT'] || "#{host.name}_#{Date.today.strftime('%Y%m%d')}.iso"
        FileUtils.cp image, output
        puts "Wrote #{output}"
      end
    end

    desc 'Generate a generic boot disk.  OUTPUT=path'
    task :generic => :environment do
      tmpl = ForemanBootdisk::Renderer.new.generic_template_render

      ForemanBootdisk::ISOGenerator.generate(:ipxe => tmpl) do |image|
        output = ENV['OUTPUT'] || "bootdisk_#{URI.parse(Setting[:foreman_url]).host}.iso"
        FileUtils.cp image, output
        puts "Wrote #{output}"
      end
    end
  end
end
