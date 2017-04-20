require 'httparty'
require 'json'
require 'awesome_print'

class Film
  def initialize
    response = HTTParty.get('http://swapi.co/api/films')
    @film = JSON.parse(response.body)
  end

  def opening_crawl(arg)
    return @film["results"].select { |films| films["episode_id"] == arg}.map { |film| film["opening_crawl"]}
  end

  def film_title(arg)
    return @film["results"].select { |films| films["episode_id"] == arg}.map { |film| film["title"]}
  end
end
