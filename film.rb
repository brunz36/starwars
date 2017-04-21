require 'httparty'
require 'json'
require 'awesome_print'

class Film
  def initialize
    response = HTTParty.get('http://swapi.co/api/films')
    @film = JSON.parse(response.body)
  end

  def list_of_films
    films = @film["results"].map { |films| films["title"] }
    films.each_with_index { |film_title, index| puts "#{index + 1}: #{film_title}" }
  end

  def opening_crawl(arg)
    film = @film["results"].find { |films| films["episode_id"] == arg}
    film["opening_crawl"]
  end

  def film_title(arg)
    film = @film["results"].find { |films| films["episode_id"] == arg}
    film["title"]
  end

  def people(arg)
    @cast = @film["results"].select { |characters| characters["episode_id"] == arg}.map { |character| character["characters"]}
    ap @cast
  end
end
