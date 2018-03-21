FactoryBot.define do
  factory :user do
    first_name 'Test'
    last_name 'User'
    email 'test@user.com'
    sequence(:spire_id) { |n| (11111111 + n).to_s }
  end
end