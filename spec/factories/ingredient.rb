FactoryBot.define do
  factory :ingredient do
    name { except_featured(Faker::Food.unique.ingredient) }

    trait :featured do
      name { Ingredient::FEATURED.sample }
    end
  end
end
