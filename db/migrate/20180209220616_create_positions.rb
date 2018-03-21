class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
      t.text :name
      t.integer :union_id

      t.timestamps
    end
  end
end
