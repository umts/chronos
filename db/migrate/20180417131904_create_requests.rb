class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.datetime :start_time
      t.datetime :end_time
      t.integer :request_type_id
      t.integer :supervisor_id
      t.boolean :approved, default: false, null: false

      t.timestamps
    end
  end
end
