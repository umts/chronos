module TimesheetsHelper
  # returns a hash of given shifts by date
  def shifts_by_date(shifts)
    shifts_hash = Hash.new{ |h, k| h[k] = [] }
    shifts.each do |shift|
      date = if shift.start_time.present?
               shift.start_time.to_date
             else
               shift.end_time.to_date
             end
      shifts_hash[date] << shift
    end
    shifts_hash
  end
end
