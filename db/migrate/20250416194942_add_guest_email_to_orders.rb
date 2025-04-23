class AddGuestEmailToOrders < ActiveRecord::Migration[7.2]
  def change
    add_column :orders, :guest_email, :string
  end
end
