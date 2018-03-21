class Union < ApplicationRecord
    has_many :positions

    validates :name, presence: true
end
