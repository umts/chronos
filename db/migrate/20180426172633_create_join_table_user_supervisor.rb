class CreateJoinTableUserSupervisor < ActiveRecord::Migration[5.1]
  def change
    create_join_table :subordinates, :supervisors do |t|
      # t.index [:subordinate_id, :supervisor_id]
      # t.index [:supervisor_id, :subordinate_id]
    end
  end
end
