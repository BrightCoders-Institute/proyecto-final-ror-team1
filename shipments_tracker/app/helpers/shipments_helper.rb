# frozen_string_literal: true

module ShipmentsHelper
  def tracking_status(status)
    I18n.t("shipments.status.#{status.downcase}")
  end

  def carrier_names
    Carrier.all.pluck(:name).map(&:upcase)
  end

  def shipment_statuses
    Shipment::STATUSES
  end
end
