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
    print "Please choose a Star Wars film: "
    selection = gets.chomp.to_i
    puts ""

    case selection
    when 0
      menu
    when 1
      puts @film.opening_crawl(1)
    when 2
      puts @film.opening_crawl(2)
    when 3
      puts @film.opening_crawl(3)
    when 4
      puts @film.opening_crawl(4)
    when 5
      puts @film.opening_crawl(5)
    when 6
      puts @film.opening_crawl(6)
    when 7
      puts @film.opening_crawl(7)
    end
  end
end

Starwars.new.menu
