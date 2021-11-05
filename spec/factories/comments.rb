FactoryBot.define do
  factory :comment do
    text { Faker::Lorem.characters(number:(2..20)) }
    association :user
    association :goal
  end
end
