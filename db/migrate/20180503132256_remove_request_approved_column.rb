class RemoveRequestApprovedColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :requests, :approved
  end
end
