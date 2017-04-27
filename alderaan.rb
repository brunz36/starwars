require 'httparty'
require 'json'
require 'awesome_print'
require_relative 'film'
require_relative 'character'

class Menu
  SWAPI_BASE_URL = "http://swapi.co/api/"

  def initialize
    response = HTTParty.get(SWAPI_BASE_URL)
    urls = JSON.parse(response.body)

    @films = Film.all(urls["films"])
  end

  def main_menu

    loop do
      puts "0 - Exit"
      @films.each_with_index do |film, index|
        puts "#{index + 1} - #{film.title}"
      end

      print "What film do you want information on? "
      choice = gets.chomp.to_i
      if choice == 0
        return
      end
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
      if choice == "n"
        return
      end
      film_to_show.characters.each_with_index do |character, index|
        puts "#{index + 1} - #{character.name}"
      end

      print "Choose a character: "
      choice = gets.chomp.to_i

      character = film_to_show.characters[choice - 1]
      show_bio(character)
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
