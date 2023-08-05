class AddAccountReferenceToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :account, index: true
  end
end
