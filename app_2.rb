require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts"
------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

puts "entre ton prénom"
print ">"
human_player = gets.chomp.to_s
user = HumanPlayer.new("#{human_player}")

player1 = Player.new("Josiane")
player2 = Player.new("José")

enemies = []
enemies << player1
enemies << player2
print enemies

while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
puts "état du joueur"
puts user.show_state
puts"=========================================================="
puts "quelle action veut tu effectuer"
puts"                                                          "
puts "a - chercher une meilleure arme"
puts "s - chercher à se soigner"
puts "0 - attaquer Josiane #{player1.show_state}"
puts "1 - attaquer José #{player2.show_state}"
print ">"


choice = gets.chomp
if choice == "a"
  user.search_weapon
elsif choice == "s"
  user.search_health_pack
elsif choice == "0"
  user.attacks(player1)
elsif choice == "1"
  user.attacks(player2)
elsif choice != "a" || "s" || "0" || "1"
  puts " tu passes un tour"
end
puts "tu es attaqué"
puts

enemies.each { |n| n.attacks(user) }
 if user.life_points <= 0
  break
end
end




puts

puts "tu as gagné!"
if user.life_points >0
else
puts "tu as perdu!"
end

binding.pry
