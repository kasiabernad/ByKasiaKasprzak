class AddRowCount < ActiveRecord::Migration
  def self.up
    add_column :bracelets, :row_count, :integer
    remove_column :bracelets, :row_number_id
  end
  def self.down
    add_column :bracelets, :row_count_id, :integer
    remove_column :bracelets, :row_count
  end
end
