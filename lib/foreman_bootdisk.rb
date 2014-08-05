require 'foreman_bootdisk/version'

module ForemanBootdisk
  ENGINE_NAME = 'foreman_bootdisk'

  require 'foreman_bootdisk/engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
end
