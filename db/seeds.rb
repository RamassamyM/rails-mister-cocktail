# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Destroying before seeding
puts 'Cleaning database...'
Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all



#  data
COCKTAILS = ["B52", "Tequila sunrise", "KGB", "Sex on the beach", "Mojito", "Pina Colada", "Cachaça", "Daiquiri", "Cuba libre", "Whisky sour", "Blue lagoon", "Negroni", "Bloody Mary", "Mai Tai", "Caïpirinha", "Kir", "Gin Tonic", "Irish Coffee", "Pisco sour"]
PICTURES = [
            "https://static.pexels.com/photos/209516/pexels-photo-209516.jpeg",
            "https://static.pexels.com/photos/34211/cocktail-summer-party-alcohol.jpg",
            "https://static.pexels.com/photos/34211/cocktail-summer-party-alcohol.jpg",
            "https://static.pexels.com/photos/169391/pexels-photo-169391.jpeg",
            "https://static.pexels.com/photos/48720/pexels-photo-48720.jpeg",
            "https://static.pexels.com/photos/338713/pexels-photo-338713.jpeg",
            "https://static.pexels.com/photos/128242/pexels-photo-128242.jpeg",
            "https://static.pexels.com/photos/338627/pexels-photo-338627.jpeg",
            "https://static.pexels.com/photos/6526/sea-beach-holiday-vacation.jpg",
            "https://static.pexels.com/photos/209516/pexels-photo-209516.jpeg",
            "https://static.pexels.com/photos/34211/cocktail-summer-party-alcohol.jpg",

]

# seeding ingredients with a web list

require 'json'
require 'open-uri'

print "Fetching ingredient list on the web...."
url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
serialized_ingredients = open(url).read
ingredients = JSON.parse(serialized_ingredients)
puts "done"
print "Seeding ingredients....."
ingredients["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
end
puts "done"

#seeding cocktails
print "Seeding cocktails...."
COCKTAILS.each_with_index do |cocktail, index|
  cocktail_record = Cocktail.create!(name: cocktail)
  url = PICTURES[index]
  cocktail_record.photo_url = url
  4.times do |index|
    ingredient = Ingredient.find(index + Ingredient.first.id)
    Dose.create!(description: "#{rand(1..3)} cl", cocktail_id: cocktail_record.id, ingredient_id: ingredient.id)
  end
end
puts "done"
