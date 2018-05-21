class Shift < ApplicationRecord
  has_paper_trail
  belongs_to :user

  validate :verify_times

  def verify_times
    if start_time.present? && end_time.present? && end_time < start_time
      errors.add(:end_time, 'cannot be before start time')
    end
  end

  def length
    if start_time && end_time
      time = ((end_time - start_time)/0.25.hour).round / 4.0
    end
  end 

  def total
    if start_time && end_time
      if length > CONFIG['lunch_start']
        [length - CONFIG['lunch_duration'], CONFIG['lunch_start']].max
      else
        length
      end
    end
  end

  def lunch
    if start_time && end_time
      if length > CONFIG['lunch_start']
        [length - total, CONFIG['lunch_duration']].min
      else
        0
      end
    end
  end
end
