class CreateTimetypes < ActiveRecord::Migration[5.1]
  def change
    create_table :timetypes do |t|
      t.integer :id
      t.text :description

      t.timestamps
    end
  end
end
