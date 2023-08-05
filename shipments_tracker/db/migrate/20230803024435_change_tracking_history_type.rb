class ChangeTrackingHistoryType < ActiveRecord::Migration[7.0]
  def up
    remove_column :shipments, :tracking_history
    add_column :shipments, :tracking_history, :jsonb, default: {}
  end

  def down
    remove_column :shipments, :tracking_history
    add_column :shipments, :tracking_history, default: [], array: true
  end
end
