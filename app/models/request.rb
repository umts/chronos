class Request < ApplicationRecord
  has_paper_trail
  belongs_to :user
  belongs_to :approved_by, class_name: 'User', optional: true
  belongs_to :request_type
  belongs_to :request_status

  scope :approved, -> { joins(:request_status).where('request_statuses.description = ?', 'approved') }
  scope :pending, -> { joins(:request_status).where('request_statuses.description = ?', 'pending') }
  scope :rejected, -> { joins(:request_status).where('request_statuses.description = ?', 'rejected') }

  validates :user, :start_time, :end_time, :request_type, presence: true

  validate :verify_times

  def verify_times
    errors.add(:end_time, ' cannot be before start time') if end_time < start_time
  end

  def approved?
    request_status.description == 'approved'
  end

  def pending?
    request_status.description == 'pending'
  end

  def rejected?
    request_status.description == 'rejected'
  end
end
