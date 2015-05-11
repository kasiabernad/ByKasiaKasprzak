class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.integer :bracelet_id
      t.integer :user_id

      t.timestamps
    end
  end
end
