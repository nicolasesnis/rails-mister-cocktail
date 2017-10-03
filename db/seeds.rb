require 'json'
require 'open-uri'
require 'nokogiri'
require 'uri'

Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")

# url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# cocktails_serialized = open(url).read
# cocktails = JSON.parse(cocktails_serialized)

# cocktails["drinks"].each do |drink|
#   cocktail = Cocktail.new(name: drink.values.join(" "))
#   image_api = "http://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{drink.values.join(" ")}"



#   image_serialized = open(image_api).read
#   image_hash = JSON.parse(image_serialized)
#   if image_hash["drinks"] != nil
#     image_url = image_hash["drinks"].first["strDrinkThumb"]
#     cocktail.remote_photo_url = image_url
#   end
#   cocktail.save!
# end



url = 'http://www.thecocktaildb.com/api/json/v1/1/filter.php?g=Cocktail_glass'
cocktails_serialized = open(url).read
cocktails = JSON.parse(cocktails_serialized)

cocktails["drinks"].sample(20).each do |drink|
  cocktail = Cocktail.new(name: drink["strDrink"])
  cocktail.remote_photo_url = drink["strDrinkThumb"]
  cocktail.save!
end
