class AddAddressFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :address, :string unless column_exists?(:users, :address)
    add_column :users, :postal_code, :string unless column_exists?(:users, :postal_code)

    # Make province_id nullable for now to avoid constraint issues
    add_reference :users, :province, foreign_key: true
  end
end
