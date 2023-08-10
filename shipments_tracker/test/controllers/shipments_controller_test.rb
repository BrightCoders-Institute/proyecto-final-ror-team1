require "test_helper"

class ShipmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get shipments_show_url
    assert_response :success
  end
end
