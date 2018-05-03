class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.date :date
      t.time :start_time
      t.time :end_time
      t.integer :request_type_id
      t.integer :request_status_id
      t.integer :approved_by_id
      t.boolean :approved, default: false, null: false

      t.timestamps
    end
  end
end
