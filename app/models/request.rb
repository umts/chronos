class Request < ApplicationRecord
  has_paper_trail
  belongs_to :user
  belongs_to :approved_by, class_name: 'User', optional: true
  belongs_to :request_type
  belongs_to :request_status

  scope :approved, -> { joins(:request_status).where('request_statuses.description = ?', 'approved') }
  scope :pending, -> { joins(:request_status).where('request_statuses.description = ?', 'pending') }
  scope :rejected, -> { joins(:request_status).where('request_statuses.description = ?', 'rejected') }

  validates :user, :request_type, presence: true

  validate :verify_times

  validate :verify_times_or_shifts

  def verify_times
    unless time_by_shifts?
      errors.add(:end_time, ' cannot be before start time') if end_time < start_time
    end
  end

  def verify_times_or_shifts
    if time_by_shifts?
      errors.add('Start time and end time cannot be present for time by shifts') if start_time.present? || end_time.present?
    else
      errors.add('Start time and end time must be present') if start_time.nil? || end_time.nil?
    end
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
