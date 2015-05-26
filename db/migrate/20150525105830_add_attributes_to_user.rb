class AddAttributesToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :phone, :string
    add_column :users, :privacy_accepted, :boolean
    add_column :users, :last_name, :string
  end
  def self.down
    remove_column :users, :phone
    remove_column :users, :privacy_accepted
    remove_column :users, :last_name
  end
end
