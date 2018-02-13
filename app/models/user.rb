class User < ApplicationRecord
    belongs_to :position
    belongs_to :supervisor, foreign_key: :supervisor_id, class_name: 'User', optional: true
end
