class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.integer :id
      t.text :description
      t.integer :union_id

      t.timestamps
    end
  end
end
