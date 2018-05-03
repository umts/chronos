class User < ApplicationRecord
  belongs_to :position, optional: true
  belongs_to :division, optional: true
  has_and_belongs_to_many :supervisors, foreign_key: :supervisor_id,
                                        association_foreign_key: :subordinate_id,
                                        class_name: 'User',
                                        join_table: :subordinates_supervisors
  has_and_belongs_to_many :subordinates, foreign_key: :subordinate_id,
                                         association_foreign_key: :supervisor_id,
                                         class_name: 'User',
                                         join_table: :subordinates_supervisors
  has_many :shifts, dependent: :destroy

  validates :first_name, :last_name, :email, :spire_id, presence: true
  validates :spire_id,  uniqueness: true,
                        length: { is: 8 },
                        numericality: { only_integer: true }

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  def full_name
    "#{first_name} #{last_name}"
  end

  # Get every user that is a subordinate or subordinate of a subordinate of
  # this user.
  def nested_subordinates
    subordinates.map { |user| user.nested_subordinates << user }.flatten
  end

  # Get every user that is a supervisor or a supervisor of a supervisor of
  # this user.
  def nested_supervisors
    supervisors.map { |user| user.nested_supervisors << user }.flatten
  end
end
