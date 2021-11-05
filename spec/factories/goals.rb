FactoryBot.define do
  factory :goal do
    target           { Faker::Lorem.characters(number:(2..20)) }
    reason           { Faker::Lorem.characters(number:(2..100)) }
    time             { Faker::Time.between(from: DateTime.now, to: DateTime.now + 1) }
    achievement      { Faker::Number.between(from: 0, to: 100) }
    like             { Faker::Number.between(from: 0, to: 100) }
    association :user
  end
end