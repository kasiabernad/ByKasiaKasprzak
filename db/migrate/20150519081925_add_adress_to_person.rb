class AddAdressToPerson < ActiveRecord::Migration
  def self.up
    add_column :users, :street_address, :string
    add_column :users, :city, :string
    add_column :users, :zip, :string
  end
  def self.down
    remove_column :users, :street_address
    reomove_column :users, :city
    remove_column :users, :zip
  end
end
