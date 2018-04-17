class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.datetime :start_time
      t.datetime :end_time
      t.string :type, limit: 3
      t.integer :supervisor_id
      t.boolean :approved

      t.timestamps
    end
  end
end
