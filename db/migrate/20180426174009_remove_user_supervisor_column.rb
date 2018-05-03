class RemoveUserSupervisorColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :supervisor_id
  end
end
