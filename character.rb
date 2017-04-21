require 'httparty'
require 'json'
require 'awesome_print'
#
class Character
  def initialize
    response = HTTParty.get('http://swapi.co/api/people')
    @character = JSON.parse(response.body)
  end

  def crew
    ap "test"
  end
end
