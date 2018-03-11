class CreateUnions < ActiveRecord::Migration[5.1]
  def change
    create_table :unions do |t|
      t.text :name

      t.timestamps
    end
  end
end
