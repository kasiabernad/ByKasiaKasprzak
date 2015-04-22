class AddToBraceletHeight < ActiveRecord::Migration
  def self.up
    add_column :bracelets, :height, :integer
  end
  def self.down
    remove_column :bracelets, :height
  end
end
