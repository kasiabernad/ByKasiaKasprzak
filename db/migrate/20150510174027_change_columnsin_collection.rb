class ChangeColumnsinCollection < ActiveRecord::Migration
  def self.up
    add_column :bracelets, :collection_id, :integer
    remove_column :collections, :bracelet_id
  end
  def self.down
    remove_column :bracelets, :collection_id
    add_column :collections, :bracelet_id, :integer
  end
end
