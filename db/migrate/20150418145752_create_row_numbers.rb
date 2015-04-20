class CreateRowNumbers < ActiveRecord::Migration
  def change
    create_table :row_numbers do |t|
      t.integer :row_number

      t.timestamps
    end
  end
end
