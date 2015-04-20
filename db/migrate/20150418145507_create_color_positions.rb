class CreateColorPositions < ActiveRecord::Migration
  def change
    create_table :color_positions do |t|
      t.integer :color_id
      t.integer :position

      t.timestamps
    end
  end
end
