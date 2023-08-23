# frozen_string_literal: true

class ShipmentsController < ApplicationController
  def show
    @shipment = find_shipment
  end

  def create
    creator = Shipments::Creator.new(permitted_params.merge(account_id: current_account.id))

    if creator.call
      redirect_to :back, notice: 'Envío creado exitosamente.'
    else
      flash.now[:alert] = result[:errors].join(', ')
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

  def permitted_params
    params.permit(:carrier_name, :status, :tracking_number, :carrier_id, :tracking_history)
  end
end
