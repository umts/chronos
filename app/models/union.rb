class Union < ApplicationRecord
  has_many :positions, dependent: :destroy

  validates :name, presence: true
end
