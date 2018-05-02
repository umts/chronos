class Shift < ApplicationRecord
  has_paper_trail
  belongs_to :user

  validate :verify_times
end
