require 'test_helper'
require 'unit/shared/access_permissions_test_base'

class AccessPermissionsTest < ActiveSupport::TestCase
  include AccessPermissionsTestBase

  check_routes(ForemanBootdisk::Engine.routes, [])
end
