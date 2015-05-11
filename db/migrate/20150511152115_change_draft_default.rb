class ChangeDraftDefault < ActiveRecord::Migration
  def self.up
    remove_column :bracelets, :draft
    add_column :bracelets, :draft, :boolean, default: true
  end
  def self.down
    add_column :bracelets, :draft, :boolean, default: false
    remove_column :bracelets, :draft
  end
end
