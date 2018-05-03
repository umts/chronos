class Shift < ApplicationRecord
  has_paper_trail
  belongs_to :user

  validate :verify_times

  def verify_times
    if end_time && start_time > end_time
      errors.add(:end_time, 'End time cannot be before start time')
    end
  end

  def length
    if start_time && end_time
      time = ((end_time - start_time)/0.25.hour).round / 4
    end
  end

  def total
    if start_time && end_time
      if length > CONSTANTS[:lunch_start]
        max(length - CONSTANTS[:lunch_duration], CONSTANTS[:lunch_start])
      else
        length
      end
    end
  end

  def lunch
    if start_time && end_time
      if length > CONSTANTS[:lunch_start]
        min(length - total, CONSTANTS[:lunch_duration])
      end
    end
  end
end
