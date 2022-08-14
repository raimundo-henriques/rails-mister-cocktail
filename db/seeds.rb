# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Erasing ingredients..."

Ingredient.destroy_all

puts "Fetching ingredients..."

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
json_serialized = URI.open(url).read
ingredient_json = JSON.parse(json_serialized)

ingredient_json["drinks"].each do |ingredient|
  Ingredient.new(name: ingredient["strIngredient1"])
  puts "Created #{ingredient["strIngredient1"]}"
end

puts "Ingredients created"
