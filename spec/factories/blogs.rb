FactoryBot.define do
  factory :blog do
    title { Faker::Dessert.variety }
    content { Faker::Dessert.topping }
    read { :published }
    user

    trait :unpublished do
      read { :unpublished }
    end
  end
end
