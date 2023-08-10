require "application_system_test_case"

class ShipmentsTest < ApplicationSystemTestCase
  setup do
    @shipment = shipments(:one)
  end

  # test "visiting the index" do
  #   visit shipments_url
  #   assert_selector "h1", text: "Shipments"
  # end

  #   test "should create shipment" do
  #     visit shipments_url
  #     click_on "New shipment"

  #     click_on "Create Shipment"

  #     assert_text "Shipment was successfully created"
  #     click_on "Back"
  #   end

  #   test "should update Shipment" do
  #     visit shipment_url(@shipment)
  #     click_on "Edit this shipment", match: :first

  #     click_on "Update Shipment"

  #     assert_text "Shipment was successfully updated"
  #     click_on "Back"
  #   end

  #   test "should destroy Shipment" do
  #     visit shipment_url(@shipment)
  #     click_on "Destroy this shipment", match: :first

  #     assert_text "Shipment was successfully destroyed"
  #   end
 end
