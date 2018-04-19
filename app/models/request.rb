class Request < ApplicationRecord
  has_paper_trail
  belongs_to :user
  belongs_to :supervisor, foreign_key: :supervisor_id, class_name: 'User', optional: true
  belongs_to :request_type

  validates :user, :start_time, :end_time, presence: true

  validate :verify_times

  def verify_times
    errors.add(:end_time, ' cannot be before start time') if end_time < start_time
  end
end
