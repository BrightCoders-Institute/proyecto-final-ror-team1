# frozen_string_literal: true

class ShipmentsController < ApplicationController
  def show
    @shipment = find_shipment
  end

  def new
    @shipment = Shipment.new
  end

  def create
    creator = Shipments::Creator.new(params[:shipment].merge(account_id: current_account.id))

    if creator.call
      redirect_to shipments_index_path, notice: 'Shipment created successfully.'
    else
      render :new
    end
  end

  def index
    @shipments = Shipment.where(account_id: current_account.id)

    @shipments = @shipments.where(status: permitted_params[:status]) if permitted_params[:status].present?

    return unless permitted_params[:carrier_name].present?

    carrier = Carrier.find_by(name: permitted_params[:carrier_name])
    @shipments = @shipments.where(carrier: carrier)
  end

  private

  def find_shipment
    Shipment.find(params[:id])
  end

  def shipment_params
    params.require(:shipment).permit(:carrier_name, :tracking_number)
  end

  def shipment_params
    params.require(:shipment).permit(:carrier_name, :tracking_number)
  end

  def permitted_params
    params.permit(:carrier_name, :status, :tracking_number, :carrier_id, :tracking_history)
  end
end
