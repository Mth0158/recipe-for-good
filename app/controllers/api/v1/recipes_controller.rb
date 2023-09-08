class Api::V1::RecipesController < ApplicationController
  include Pagy::Backend
  before_action :set_recipe, only: %i[show]

  def index
    recipes = RecipeService::Finder.call(Recipe.all, filter_params)
    @pagy, @recipes = pagy_array(recipes)
    @pagy_metadata = pagy_metadata(@pagy)
  end

  def show; end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def filter_params
    params.permit(
      ingredients: []
    )
  end
end
