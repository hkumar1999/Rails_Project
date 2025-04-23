class AddProvinceAndPostalCodeToUsers < ActiveRecord::Migration[7.0]
  def change
    #add_reference :users, :province, foreign_key: true, null: false
    add_column :users, :postal_code, :string unless column_exists?(:users, :postal_code)
  end
end
