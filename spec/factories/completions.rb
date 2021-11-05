FactoryBot.define do
  factory :completion do
    content { Faker::Lorem.characters(number:(2..20)) }
    association :goal
  end
end
