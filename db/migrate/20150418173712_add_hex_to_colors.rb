class AddHexToColors < ActiveRecord::Migration
  def self.up
    add_column :colors, :hex, :string
  end
  def self.down
    remove_column :colors, :hex
  end
end
