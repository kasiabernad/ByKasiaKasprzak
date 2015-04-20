class CreateBracelets < ActiveRecord::Migration
  def change
    create_table :bracelets do |t|
      t.string :clasp
      t.string :casp
      t.integer :color_position_id
      t.integer :row_number_id
      t.integer :price

      t.timestamps
    end
  end
end
