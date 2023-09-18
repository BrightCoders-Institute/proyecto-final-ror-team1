# frozen_string_literal: true

require 'test_helper'

class Carriers::TrackingRequesterDhlTest < ActiveSupport::TestCase
  def setup
    @account = Account.create(company_name: 'test', active: true)
    @carrier = Carrier.create(name: 'DHL', url: 'https://api-test.dhl.com/track/shipments?trackingNumber=')
    @shipment = Shipment.create(
      account_id: @account.id,
      carrier_id: @carrier.id,
      status: 'REGISTERED',
      tracking_history: [],
      tracking_number: '3484059994'
    )
    @parser_rule_delivered = ParserRule.create(code: 'delivered', description: 'Delivered', internal_code: 'DELIVERED',
                                               carrier_id: @carrier.id)
    @parser_rule_in_transit = ParserRule.create(code: 'transit', description: 'In transit',
                                                internal_code: 'IN_TRANSIT', carrier_id: @carrier.id)
    @parser_rule_pre_transit = ParserRule.create(code: 'pre-transit', description: 'Collected',
                                                 internal_code: 'REGISTERED', carrier_id: @carrier.id)
    @service = Carriers::TrackingRequesterDhl.new(carrier_name: 'DHL', tracking_number: '3484059994')
  end

  def test_tracking_history_not_empty
    # Act
    tracking_history = @service.call

    # Assert
    refute_empty tracking_history, 'Tracking history should not be empty'
  end

  def test_tracking_history_has_12_events
    # Act
    tracking_history = @service.call[:tracking_history]

    # Assert
    assert_equal 12, tracking_history.length, 'Tracking history must have 12 events'
  end
end
