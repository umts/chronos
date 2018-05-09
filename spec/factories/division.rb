FactoryBot.define do
  factory :division do
    initialize_with { Division.find_or_create_by(name: 'Test Division') }
  end
end
