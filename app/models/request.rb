class Request < ApplicationRecord
  has_paper_trail
  belongs_to :user
  belongs_to :supervisor, foreign_key: :supervisor_id, class_name: 'User'

  validate :verify_times

  def verify_times
    errors.add(:end_time, 'End time cannot be before start time') if start_time < end_time
  end
end
