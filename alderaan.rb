require 'awesome_print'

# require_relative 'film'
# require_relative 'character'

class Starwars
  def menu
    puts "Please choose a Star Wars film"
    puts "1: The Phantom Menace"
    puts "2: Attack of the Clones"
    puts "3: Revenge of the Sith"
    puts "4: A New Hope"
    puts "5: Empire Strikes Back"
    puts "6: Return of the Jedi"
    puts "7: The Force Awakens"
    selection = gets.chomp.to_i

    case selection
    when 0
      puts "Please put select 1 thru 7."
    when 1
      puts "1"
    when 2
      puts "2"
    when 3
      puts "3"
    when 4
      puts "4"
    when 5
      puts "5"
    when 6
      puts "6"
    when 7
      puts "7"
    end
  end
end

star_wars = Starwars.new

star_wars.menu
