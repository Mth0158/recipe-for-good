module Extractors
  class FakerIngredients
    def self.extract(ingredients = [])
      new(ingredients).extract
    end

    def initialize(ingredients = [])
      @ingredients = ingredients
    end

    def extract
      @ingredients.each do |ingredient|
        create_ingredient(ingredient)
      end
    end

    private

    def create_ingredient(ingredient)
      Ingredient.create(
        name: ingredient["name"]
      )
    end
  end
end
