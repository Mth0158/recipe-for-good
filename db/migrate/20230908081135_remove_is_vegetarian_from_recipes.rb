class RemoveIsVegetarianFromRecipes < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :is_vegetarian
  end
end
