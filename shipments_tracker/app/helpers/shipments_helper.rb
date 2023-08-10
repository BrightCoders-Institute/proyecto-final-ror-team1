module ShipmentsHelper
  def tracking_status(status)
    I18n.t("shipments.status.#{status.downcase}")
  end
end

# @shipments.each do |shipment|
#   tracking_status(shipment.status)
# end
