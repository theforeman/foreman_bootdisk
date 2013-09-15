namespace :bootdisk do
  namespace :generate do
    desc 'Generate a static boot disk for a specific host.  NAME=fqdn, OUTPUT path'
    task :host => :environment do
      host = Host::Base.find_by_name(ENV['NAME']) || raise("cannot find host '#{ENV['NAME']}', specify NAME=fqdn")
      tmpl = host.bootdisk_template_render

      Bootdisk::ISOGenerator.new(tmpl).generate do |image|
        output = ENV['OUTPUT'] || "#{host.name}.#{type}"
        FileUtils.cp image, output
        puts "Wrote #{output}"
      end
    end
  end
end
