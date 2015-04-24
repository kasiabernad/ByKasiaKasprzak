class AddUserAndDraftToBracelet < ActiveRecord::Migration
  def self.up
    add_column :bracelets, :user_id, :integer
    add_column :bracelets, :draft, :boolean, default: false
  end
  def self.down
    remove_column :bracelets, :user_id
    remove_column :bracelets, :draft
  end
end
