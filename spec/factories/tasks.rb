FactoryBot.define do
  factory :task do
    content { Faker::Lorem.characters(number:(2..20)) }
    association :goal
  end
end
