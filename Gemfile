source "http://rubygems.org"

gemspec

FOREMAN_GEMFILE=File.expand_path('../.foreman_app/Gemfile', __FILE__)
unless File.exist?(FOREMAN_GEMFILE)
  puts <<MESSAGE
Foreman source code is not present. To get the latest version, run:

  rake setup:foreman_prepare

and try again.
MESSAGE

else
  self.instance_eval(Bundler.read_file(FOREMAN_GEMFILE))
end
