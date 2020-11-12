# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.firstputs 'Cleaning database...'
require 'json'
require 'open-uri'

puts 'Cleaning database...'
Ingredient.destroy_all

# lemon = { name: "lemon" }
# ice = { name: "ice" }
# mint_leaves = { name: "mint_leaves" }
# vodka = { name: "vodka" }

# [lemon, ice, mint_leaves, vodka].each do |attributes|
#   ingredient = Ingredient.create!(attributes)
#   puts "Created #{ingredient.name}"
# end

puts 'Creating restaurants...'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

ingredients['drinks'].each do |attributes|
  ingredient = Ingredient.create!(name: attributes['strIngredient1'])
  puts "Created #{ingredient.name}"
end

puts 'Finished!'
