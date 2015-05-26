class AddShippingAddressToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :shipping_street_address, :string
    add_column :users, :shipping_city, :string
    add_column :users, :shipping_zip, :string
  end
  def self.down
    remove_column :users, :shipping_street_address
    reomove_column :users, :shipping_city
    remove_column :users, :shipping_zip
  end
end
