module Carriers
  class TrackingRequesterDhl
    include HTTParty

    def initialize(params = {})
      @params = params
      @tracking_number = @params[:tracking_number]
      @carrier_name = @params[:carrier_name]
    end

    def call
      request_shipment
      homologate_response
    end

    private
    binding.pry
    def request_shipment
      api_key = ENV['DHL_API_KEY']
      request_url = "#{carrier.url}#{@tracking_number}"

      @response = HTTParty.get(
        request_url,
        headers: { 'DHL-API-Key': api_key }
      )

      raise StandardError unless @response.success?

      @response.deep_symbolize_keys!
    end

    def homologate_response
      {
        tracking_number: @tracking_number,
        carrier: @carrier_name,
        status: find_parsed_rule(@response[:shipments].first[:status][:statusCode]).internal_code,
        tracking_history: parse_events,
        destination: @response[:shipments].first&.[](:destination)&.[](:address)&.values&.join(' ')
      }
    end

    def parse_events
      @response[:shipments].first[:events].map do |event|
        parsed_rule = find_parsed_rule(event[:statusCode])
        {
          code: event[:statusCode],
          date: event[:timestamp],
          status: parsed_rule.internal_code,
          location: event&.[](:location)&.[](:address)&.values&.join(' '),
          description: event&.[](:description) || '',
          event_comment: '',
          parser_rule_id: parsed_rule.id
        }
      end
    end

    def find_parsed_rule(code)
      ParserRule.find_or_create_by(carrier: carrier, code: code)
    end

    def carrier
      @carrier ||= Carrier.find_by(name: @carrier_name)
    end
  end
end
