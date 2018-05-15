class AddTimeByShiftsToRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :time_by_shifts, :boolean
  end
end
