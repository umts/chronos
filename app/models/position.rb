class Position < ApplicationRecord
    has_many :users
    belongs_to :union

    validates :name, presence: true
end
