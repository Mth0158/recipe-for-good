class Api::V1::IngredientsController < ApplicationController
  include Pagy::Backend

  def index
    @ingredients = if filter_params[:featured].present?
                     Ingredient.featured
                   elsif filter_params[:query].present?
                     Ingredient.with_name_containing(filter_params[:query])
                   else
                     Ingredient.all
                   end
  end

  private

  def filter_params
    params.permit(
      :featured,
      :query
    )
  end
end
