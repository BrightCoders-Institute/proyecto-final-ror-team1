class ShipmentsController < ApplicationController


  def show
    @shipment = find_shipment
  end

  private

  def find_shipment
    Shipment.find(params[:id])
  end
end
