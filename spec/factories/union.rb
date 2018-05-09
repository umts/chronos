FactoryBot.define do
  factory :union do
    initialize_with { Union.find_or_create_by(name: 'Test Union') }
  end
end
