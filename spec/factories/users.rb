FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    nickname              { Faker::Internet.username(specifier: 5..10) }
    age_id                { Faker::Number.between(from: 2, to: 10) }
    sex_id                { Faker::Number.between(from: 2, to: 4) }
    profession_id         { Faker::Number.between(from: 2, to: 10) }
    effort                { Faker::Lorem.sentence }
  end
end
