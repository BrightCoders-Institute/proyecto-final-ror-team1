# frozen_string_literal: true

require 'application_system_test_case'

class ShipmentsTest < ApplicationSystemTestCase
  setup do
    @shipment = shipments(:one)
  end

  test 'visiting the index' do
    visit shipments_url
    assert_selector 'h1', text: 'Shipments'
  end
end
