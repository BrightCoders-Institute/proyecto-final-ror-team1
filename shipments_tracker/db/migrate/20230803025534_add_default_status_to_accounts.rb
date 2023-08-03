class AddDefaultStatusToAccounts < ActiveRecord::Migration[7.0]
  def change
    change_column_default :accounts, :active, true
    change_column_null :accounts, :active, false
  end
end
