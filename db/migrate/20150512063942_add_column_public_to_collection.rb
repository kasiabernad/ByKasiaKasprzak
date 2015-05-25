class AddColumnPublicToCollection < ActiveRecord::Migration
  def self.up
    add_column :collections, :public, :boolean, :default => false
  end
  def self.down
    remove_column :collections, :public
  end
end
