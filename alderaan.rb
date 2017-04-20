require 'awesome_print'

require_relative 'film'
require_relative 'character'

class Starwars
  def initialize
    @film = Film.new
    # @character = Character.new
  end

  def menu
    puts "1: The Phantom Menace"
    puts "2: Attack of the Clones"
    puts "3: Revenge of the Sith"
    puts "4: A New Hope"
    puts "5: Empire Strikes Back"
    puts "6: Return of the Jedi"
    puts "7: The Force Awakens"
    print "Please choose a Star Wars Film: "
    selection = gets.chomp.to_i
    puts ""

    puts @film.opening_crawl(selection)
    puts ""
    print "Would you like to more information on "
    puts @film.film_title(selection)
  end
end

Starwars.new.menu
