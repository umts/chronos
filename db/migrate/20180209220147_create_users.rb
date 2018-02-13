class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :division
      t.integer :position_id
      t.integer :supervisor_id
      t.integer :swipe_id
      t.integer :hr_id
      t.string :spire_id

      t.timestamps
    end
  end
end
