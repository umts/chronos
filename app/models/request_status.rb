class RequestStatus < ApplicationRecord
  validates :description, presence: true, uniqueness: true

  scope :approved, -> { find_by(description: 'approved') }
  scope :pending, -> { find_by(description: 'pending') }
  scope :rejected, -> { find_by(description: 'rejected') }
end
