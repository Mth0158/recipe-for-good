module RecipeService
  class Finder < Service
    def initialize(relation, params)
      @relation = relation
      params ||= ActionController::Parameters.new
      @ingredients = params[:ingredients] || []
    end

    def call
      return @relation if @ingredients.empty?

      order_recipes_by_matching_ingredient_count(find_recipes)
    end

    private

    def find_recipes
      conditions = @ingredients.map do
        "EXISTS (SELECT 1 FROM unnest(ingredients) AS ingredient WHERE ingredient ILIKE ?)"
      end
      query = "SELECT * FROM recipes WHERE #{conditions.join(" OR ")}"

      Recipe.find_by_sql([query, *@ingredients.map { |ingredient| "%#{ingredient}%" }])
    end

    def order_recipes_by_matching_ingredient_count(recipes)
      recipes.sort_by { |recipe| -matching_ingredient_count(recipe) }
    end

    def matching_ingredient_count(recipe)
      recipe.ingredients.count { |ingredient| ingredient =~ /#{@ingredients.join('|')}/i }
    end
  end
end
