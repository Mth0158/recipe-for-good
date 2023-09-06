class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :name, index: true
      t.boolean :is_featured, default: false, null: false

      t.timestamps
    end
  end
end
