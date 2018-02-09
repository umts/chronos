class CreateUnions < ActiveRecord::Migration[5.1]
  def change
    create_table :unions do |t|
      t.integer :id
      t.text :description

      t.timestamps
    end
  end
end
