module TimesheetHelper
  # returns a hash of given shifts by date
  def shifts_by_date(shifts)
    shifts_hash = Hash.new{|h, k| h[k] = []}
    shifts.each do |shift|
      shifts_hash[shift.start_time.to_date] << shift
    end
    return shifts_hash
  end
end
