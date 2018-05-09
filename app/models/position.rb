class Position < ApplicationRecord
  has_many :users, dependent: :nullify
  belongs_to :union

  validates :name, presence: true, uniqueness: { scope: :union }
end
