class AddBraceletIdToColorPosition < ActiveRecord::Migration
  def self.up
    add_column :color_positions, :bracelet_id, :integer
  end
  def self.down
    remove_column :color_positions, :bracelet_id
  end
end
