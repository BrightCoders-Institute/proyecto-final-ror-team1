# frozen_string_literal: true

require 'test_helper'

class ShipmentTest < ActiveSupport::TestCase
  def setup
    @account = Account.create(company_name: 'test', active: true)
    @carrier = Carrier.create(name: 'FEDEX', url: 'https://fedex.com')
    @shipment = Shipment.new(
      account_id: @account.id,
      carrier_id: @carrier.id,
      status: 'REGISTERED',
      tracking_history: ['Event 1'],
      tracking_number: 'ABC123'
    )
  end

  test 'should be valid' do
    assert @shipment.valid?, @shipment.errors.full_messages.join(', ')
  end

  test 'should require account_id' do
    @shipment.account_id = nil
    assert_not @shipment.valid?, @shipment.errors.full_messages.join(', ')
  end

  test 'should require status' do
    @shipment.status = nil
    assert_not @shipment.valid?, @shipment.errors.full_messages.join(', ')
  end
end
