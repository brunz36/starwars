require 'awesome_print'

require_relative 'film'
require_relative 'character'

class Starwars
  def initialize
    @film = Film.new
    # @character = Character.new
  end


  def menu
    until (1..7).include?@selection
      puts "The Greatest Story ever told, please choose a chapter for more info."
      @film.list_of_films
      print "Please choose a Star Wars Film: "
      @selection = gets.chomp.to_i
      puts ""
    end
    crawl
  end

  def crawl
    puts @film.opening_crawl(@selection)
    puts ""
    more_info_film
  end

  def more_info_film
    puts "Would you like to know more information on #{@film.film_title(@selection)}?"
    print "Yes or No: "
    yes_no = gets.chomp.downcase
    if yes_no == "yes"
      @film.people(@selection)
    else
      ap "NO"
    end
  end
end

Starwars.new.menu
