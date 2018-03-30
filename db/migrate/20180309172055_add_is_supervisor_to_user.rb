class AddIsSupervisorToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :is_supervisor, :boolean
  end
end
