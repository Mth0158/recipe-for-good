module Extractors
  class AllRecipes
    def self.extract(recipes = [])
      new(recipes).extract
    end

    def initialize(recipes = [])
      @recipes = recipes
    end

    def extract
      @recipes.each do |recipe|
        create_recipe(recipe)
      end
    end

    private

    def create_recipe(recipe)
      Recipe.create(
        title: recipe["title"],
        cook_time: recipe["cook_time"],
        prep_time: recipe["prep_time"],
        ingredients: recipe["ingredients"],
        rating: recipe["ratings"],
        image_url: recipe["image"]
      )
    end
  end
end
