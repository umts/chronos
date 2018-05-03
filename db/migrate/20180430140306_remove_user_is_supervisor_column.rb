class RemoveUserIsSupervisorColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :is_supervisor
  end
end
