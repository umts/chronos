class AddKingToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :king, :boolean, default: false
  end
end
