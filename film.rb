require 'httparty'
require 'json'
require 'ap'

class Film
  def initialize
    response = HTTParty.get('http://swapi.co/api/films')
    @film = JSON.parse(response.body)
  end

  def opening_crawl(arg)
    return @film["results"].select { |films| films["episode_id"] == arg}.map { |film| film["opening_crawl"]}
  end
end
