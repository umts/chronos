FactoryBot.define do
  factory :shift do
    start_time Time.now
    end_time Time.now+4.hours
    association :user
  end
end
