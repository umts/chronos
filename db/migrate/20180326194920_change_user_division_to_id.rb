class ChangeUserDivisionToId < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.change :division, :integer
      t.rename :division, :division_id
    end
  end
end
