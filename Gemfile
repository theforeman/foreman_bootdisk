# frozen_string_literal: true

source 'http://rubygems.org'

gemspec

FOREMAN_GEMFILE = File.expand_path('.foreman_app/Gemfile', __dir__)
if File.exist?(FOREMAN_GEMFILE)
  instance_eval(Bundler.read_file(FOREMAN_GEMFILE))
else
  puts <<~MESSAGE
    Foreman source code is not present. To get the latest version, run:

      rake setup:foreman_prepare

    and try again.
MESSAGE

end
