class RequestType < ApplicationRecord
  has_paper_trail

  default_scope { order(description: :desc) }

  validates :code, presence: true, length: { maximum: 3 }
  validates :description, presence: true, length: { maximum: 64 }
end
