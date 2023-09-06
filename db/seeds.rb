start_time = Time.current

puts "\n---- Starting seed process ----"
puts "\nNew data :"
puts "It will take between 30s to 1 minute to complete..."

file = File.read(Rails.root.join("lib/seeds/recipes-en.json"))
data_array = JSON.parse(file)
Extractors::AllRecipes.extract(data_array)

file = File.read(Rails.root.join("lib/seeds/ingredients-en.json"))
data_array = JSON.parse(file)
Extractors::FakerIngredients.extract(data_array)

puts "> Recipes:                      #{Recipe.count}"
puts "> Ingredients:                  #{Ingredient.count}"
puts ">> Featured ingredients:        #{Ingredient.featured.count}"
puts "\n---- Seed done in #{(Time.current - start_time).truncate(2)} s ----"
