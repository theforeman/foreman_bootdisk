module Bootdisk
  ENGINE_NAME = 'bootdisk'
  VERSION = '1.0.0'

  require 'bootdisk/engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
end
