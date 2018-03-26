FactoryBot.define do
  factory :shift do
    start_time Time.now
    association :user
  end
end
