require "test_helper"

class ShipmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shipment = shipments(:one)
  end

  test "should get show" do
    get shipments_show_url
    assert_response :success
  end

  test "should get index" do
    get shipments_url
    assert_response :success
  end
  
  test "should get index with filtered params" do
    get shipments_url, params: { carrier_name: 'FEDEX' }
    assert_response :success
  end

  test "should get index with filtered params" do
    get shipments_url, params: { status: 'DELIVERED' }
    assert_response :success
  end

  test "should get show" do
    get shipments_show_url
    assert_response :success
  end
end
