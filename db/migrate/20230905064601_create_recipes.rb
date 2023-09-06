class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :cook_time
      t.integer :prep_time
      t.string :ingredients, array: true, default: []
      t.float :rating
      t.string :image_url
      t.boolean :is_vegetarian, default: false, null: false

      t.timestamps
    end
  end
end
