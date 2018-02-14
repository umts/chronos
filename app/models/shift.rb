class Shift < ApplicationRecord
  has_paper_trail
  belongs_to :user

  validate :verify_times

  def verify_times
    errors.add(:end_time, 'End time cannot be before start time') if start_time < end_time
    errors.add(:start_time, 'Start time cannot be in the past')   if start_time < Time.zone.now
    errors.add(:end_time, 'End time cannot be in the past')       if end_time < Time.zone.now
  end
end
