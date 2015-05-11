class ChangesinOrder < ActiveRecord::Migration
  def self.up
    remove_column :orders, :bracelet_id
    add_column :orders, :user_id, :integer
  end
  def self.down
    remove_column :orders, :user_id
    add_column :orders, :bracelet_id, :integer
  end
end
