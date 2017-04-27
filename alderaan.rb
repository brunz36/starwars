require 'httparty'
require 'json'
require 'awesome_print'
require_relative 'swapi_attribute'
require_relative 'film'
require_relative 'character'

class Menu
  SWAPI_BASE_URL = "http://swapi.co/api/"

  def initialize
    response = HTTParty.get(SWAPI_BASE_URL)

    @films = Film.all(response.parsed_response["films"])
  end

  def show_list(list_array, opening_message, choice_message)
    puts opening_message
    list_array.each_with_index do |element, index|
      print "#{index + 1} "
      yield element
    end

    print choice_message
    gets.chomp.to_i
  end

  def main_menu

    loop do
      choice = show_list(@films, "0  - Exit", "What film do you want information on? ") do |film|
        puts " - #{film.title}"
      end

      return if choice == 0

      show_film(@films[choice - 1])
    end
  end

  def show_film(film_to_show)
    puts
    puts "#{film_to_show.title}"
    puts
    puts film_to_show.opening_crawl

    loop do
      puts
      print "Do you want more information on #{film_to_show.title}. [Y/N]"
      choice = gets.chomp.downcase
      puts
      return if choice == "n"

      choice = show_list(film_to_show.characters, "", "Choose a character: ") do |character|
        puts " - #{character.name}"
      end

      show_bio(film_to_show.characters[choice - 1])
    end
  end

  def show_bio(character)
    puts
    puts "Here is #{character.name} bio: "
    puts "Height: #{character.height}"
    puts "Mass: #{character.mass}"
    puts "Eye Color: #{character.eye_color}"
    puts "Birth Year: #{character.birth_year}"
    puts "Gender: #{character.gender}"
    puts
  end
end

Menu.new.main_menu
