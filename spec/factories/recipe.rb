FactoryBot.define do
  factory :recipe do
    title { Faker::Food.unique.dish }
    cook_time { rand(1..30) }
    prep_time { cook_time + rand(1..20) }
    ingredients do
      [
        "1 (2 pound) ham steak, cut into 1-inch pieces",
        "1 ½ pounds red new potatoes, halved",
        "1 pound fresh green beans, trimmed and halved",
        "1 small onion, coarsely chopped",
        "½ cup butter",
        "water to cover",
        "salt and ground black pepper to taste"
      ]
    end
    rating { rand(1..5) }
    image_url { Faker::Internet.url(host: "example.com", path: "/anything") }
  end
end
