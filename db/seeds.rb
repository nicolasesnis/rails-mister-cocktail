require 'json'
require 'open-uri'
require 'nokogiri'
require 'uri'

Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
cocktails_serialized = open(url).read
cocktails = JSON.parse(cocktails_serialized)

cocktails["drinks"].each do |drink|
  cocktail = Cocktail.new(name: drink.values.join(" "))
cocktail.save!
end
