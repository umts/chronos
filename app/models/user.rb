class User < ApplicationRecord
  belongs_to :position, optional: true
  belongs_to :division, optional: true
  belongs_to :supervisor, foreign_key: :supervisor_id, class_name: 'User', optional: true
  has_many :subordinates, foreign_key: :supervisor_id, class_name: 'User'
  has_many :shifts, dependent: :destroy

  validates :first_name, :last_name, :email, :spire_id, presence: true
  validates :spire_id,  uniqueness: true,
                        length: { is: 8 },
                        numericality: { only_integer: true }
  validates :king, uniqueness: true, if: -> { king }
  validates :supervisor, presence: true, unless: -> { king }

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  def full_name
    "#{first_name} #{last_name}"
  end

  # Get every user that is a subordinate, or subordinate of a subordinate of
  # this user.
  def nested_subordinates
    subordinates.map do |subordinate|
      subordinate.nested_subordinates << subordinate
    end.flatten
  end

  # Get every user that is a supervisor, or a supervisor of a supervisor of
  # this user. If user is king return empty array.
  def nested_supervisors
    king ? [] : supervisor.nested_supervisors << supervisor
  end

  def union
    position.union
  end

  def supervisor_of?(user)
    nested_subordinates.include? user
  end

  def subordinate_of?(user)
    nested_supervisors.include? user
  end

  # Only a valid supervisor for another user that is not this user and that is
  # not a supervisor of this user.
  def valid_supervisor_for?(user)
    if user == self
      false
    elsif nested_supervisors.include? user
      false
    else
      true
    end
  end
end
