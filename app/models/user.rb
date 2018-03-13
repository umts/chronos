class User < ApplicationRecord
  belongs_to :position
  belongs_to :division
  belongs_to :supervisor, foreign_key: :supervisor_id, class_name: 'User', optional: true
  has_many :subordinates, foreign_key: :supervisor_id, class_name: 'User'
  has_many :shifts

  validates :first_name, :last_name, :email, :spire_id, presence: true
  validates :spire_id,  uniqueness: true,
                        length: { is: 8 },
                        numericality: { only_integer: true }
end
