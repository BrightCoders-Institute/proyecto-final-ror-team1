# frozen_string_literal: true

require 'test_helper'

class CarrierTest < ActiveSupport::TestCase
  test 'should not save carrier without name' do
    carrier = Carrier.new
    assert_not carrier.save, 'Saved carrier without name'
  end

  test 'should not save carrier without url' do
    carrier = Carrier.new
    assert_not carrier.save, 'Saved carrier without url'
  end

  test 'should not save carrier with invalid url' do
    carrier = Carrier.new(name: 'DHL', url: 'my_url')
    assert_not carrier.save, 'Saved carrier with invalid url'
  end

  test 'should save carrier with valid data' do
    carrier = Carrier.new(id: 1, name: 'DHL', url: 'https://www.dhl.com', settings: "{id: 3,name: 'DHL'}")
    assert carrier.save,
           "Could not save the carrier with valid data. Errors: #{carrier.errors.full_messages.join(', ')}"
  end
end
