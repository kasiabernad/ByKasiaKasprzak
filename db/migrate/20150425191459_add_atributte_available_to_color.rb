class AddAtributteAvailableToColor < ActiveRecord::Migration
  def self.up
    add_column :colors, :available, :boolean, default:true
  end
  def self.down
    remove_column :colors, :available
  end
end
