require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new("Josiane")
player2 = Player.new("José")
while player1.life_points > 0 || player2.life_points > 0 
puts player1.show_state
puts player2.show_state
puts "Passons à la phase d'attaque :"
player1.attacks(player2)
player2.attacks(player1)
break if player2.life_points < 0 || player1.life_points < 0
end 

binding.pry