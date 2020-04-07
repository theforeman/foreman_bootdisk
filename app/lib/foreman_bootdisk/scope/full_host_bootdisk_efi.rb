# frozen_string_literal: true

module ForemanBootdisk
  module Scope
    class FullHostBootdiskEfi < Bootdisk
      def kernel(medium_provider)
        '/' + ForemanBootdisk::ISOGenerator.iso9660_filename(super)
      end

      def initrd(medium_provider)
        '/' + ForemanBootdisk::ISOGenerator.iso9660_filename(super)
      end
    end
  end
end
