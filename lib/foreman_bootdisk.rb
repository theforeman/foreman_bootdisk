require 'bootdisk/version'

module Bootdisk
  ENGINE_NAME = 'bootdisk'

  require 'bootdisk/engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
end
