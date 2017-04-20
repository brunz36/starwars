require 'httparty'
require 'json'
require 'ap'

class Film
  response = HTTParty.get("http://swapi.co/api/films",)

  list = JSON.parse(response.body)

  list["results"].select { |film| puts film["title"]}
end
