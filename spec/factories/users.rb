FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    age { rand(100) }
    email { Faker::Internet.email }
    password_digest { "password" }
  end
end
