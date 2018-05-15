class RequestType < ApplicationRecord
  has_paper_trail

  default_scope { order(description: :desc) }

  validates :code, :description, presence: true, uniqueness: true
end
