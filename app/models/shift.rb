class Shift < ApplicationRecord
  has_paper_trail
  belongs_to :user

  validate :verify_times

  def verify_times
    if end_time && start_time > end_time
      errors.add(:end_time, 'End time cannot be before start time')
    end
  end
end
