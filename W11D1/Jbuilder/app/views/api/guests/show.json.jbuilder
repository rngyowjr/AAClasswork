# json.extract! @guest, :name, :age, :favorite_color

# json.banana @guest.gifts do |gift|
#   json.title1 gift.title
# end

json.guest do
  json.name @guest.name
  json.age @guest.age
  json.favorite_color @guest.favorite_color
  json.gifts @guest.gifts do |gift|
    json.title gift.title
  end
end

# show json = {guest: {...}}

# show json = {"name":"John Smith","age":45,"favorite_color":"Blue","gifts":[{"title":"A Bottle of Wine"},{"title":"Another Bottle of Wine"}]}

# index [{"name":"John Smith"},{"name":"Jane Doe"},{"name":"Josh Brown"},{"name":"Helen White"},{"name":"Job Bluth"}]