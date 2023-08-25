module Shipments
  class Creator

    def initialize(params = {})
      @params = params
      @carrier_name = @params[:carrier_name].upcase
    end

    def call
      validate_fields_present
      set_carrier
      create_shipment

      true
    rescue StandardError => e
      raise ShipmentError.new("Error al crear el envío: #{e.message}")
    end

    def validate_fields_present
      unless @params[:carrier_name].present? && @params[:tracking_number].present?
        raise ShipmentError, 'Los campos no pueden estar vacíos.'
      end
    end

    private

    def set_carrier
      @carrier = Carrier.find_by!(name: @carrier_name)
    end

    def create_shipment
      Shipment.create(
        shipment_params
      )
    end

    def shipment_params
      {
        status: 'REGISTERED',
        tracking_number:  @params[:tracking_number],
        carrier_id: @carrier.id,
        account_id: @params[:account_id]
      }
    end
  end
end
