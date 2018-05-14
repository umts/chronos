FactoryBot.define do
  factory :position do
    initialize_with { Position.find_or_create_by(name: 'Test Position') }
    association :union
  end
end
