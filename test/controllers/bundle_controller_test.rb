require "test_helper"

class BundleControllerTest < ActionDispatch::IntegrationTest
  test "should get install" do
    get bundle_install_url
    assert_response :success
  end
end
