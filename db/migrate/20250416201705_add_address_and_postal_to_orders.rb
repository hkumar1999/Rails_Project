class AddAddressAndPostalToOrders < ActiveRecord::Migration[7.2]
  def change
    add_column :orders, :address, :string
    add_column :orders, :postal_code, :string
  end
end
