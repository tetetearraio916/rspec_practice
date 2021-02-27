FactoryBot.define do
  factory :blog do
    title { Faker::Name.name }
    content { Faker::Dessert.topping }
    read { :published }
    user

    trait :unpublished do
      read { :unpublished }
    end
  end
end
