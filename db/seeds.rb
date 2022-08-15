# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Erasing everything"

Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

puts "Fetching ingredients..."

ingredients_url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients_serialized = URI.open(ingredients_url).read
ingredient_json = JSON.parse(ingredients_serialized)

ingredient_json["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
  puts "Created #{ingredient["strIngredient1"]}"
end

puts "Ingredients created"

puts "Creating cocktails"

10.times do
  random_cocktail_url = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
  cocktail_serialized = URI.open(random_cocktail_url).read
  cocktail_json = JSON.parse(cocktail_serialized)
  cocktail = Cocktail.create!(name: cocktail_json["drinks"][0]["strDrink"], picture: cocktail_json["drinks"][0]["strDrinkThumb"])
  puts "Created #{cocktail.name}"
end

puts "Creating doses"

Cocktail.all.each do |cocktail|
  descriptions = ["2cl", "4cl", "6cl", "10cl"]
  dose = Dose.create!(description: descriptions.sample, cocktail: cocktail, ingredient: Ingredient.all.sample)
  puts "Created dose of #{dose.ingredient.name} (#{dose.description}) for #{cocktail.name}"
  dose = Dose.create!(description: descriptions.sample, cocktail: cocktail, ingredient: Ingredient.all.sample)
  puts "Created dose of #{dose.ingredient.name} (#{dose.description}) for #{cocktail.name}"
  dose = Dose.create!(description: descriptions.sample, cocktail: cocktail, ingredient: Ingredient.all.sample)
  puts "Created dose of #{dose.ingredient.name} (#{dose.description}) for #{cocktail.name}"
  dose = Dose.create!(description: descriptions.sample, cocktail: cocktail, ingredient: Ingredient.all.sample)
  puts "Created dose of #{dose.ingredient.name} (#{dose.description}) for #{cocktail.name}"
end

puts "Created doses"
