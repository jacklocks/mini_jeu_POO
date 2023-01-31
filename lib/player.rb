class Player
  attr_accessor :name, :life_points
 
  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts " #{name} a #{life_points} points de vie "
  end

  def gets_damage(damage_received) #damage_received est un entier qu'on met en entrée de la méthode
    @life_points = @life_points - damage_received
    if @life_points <= 0
      puts "le joueur #{@name} a été tué!" # l'écriture #{} permet d'insérer une variable dans un string
  end
end

  def attacks(player)
    puts "le joueur #{@name} attaque le joueur #{player.name} "
    damage = compute_damage
    puts "il lui inflige #{damage} points de dommages "
    player.gets_damage(damage)
    
  end

  def compute_damage
    return rand(1..6)
    end
end

class HumanPlayer < Player
  attr_accessor :weapon_level, :life_points

  def initialize(name)
    super
    @weapon_level = 1
    @life_points = 100
  end

    def show_state
      puts " #{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level} "
    end

    def search_weapon
     new_weapon_level = rand(1..6)
     puts "tu viens de trouver une nouvelle arme de niveau #{new_weapon_level} ! "
     if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts "cette arme est meilleure que ton arme actuelle, tu la prends!"
     elsif
      puts "cette arme n'est pas mieux que ton arme actuelle!"
     end
    end

    def search_health_pack
      new_life_points = rand(1..6)
      case new_life_points
      when 1
        puts "Tu n'as rien trouvé..."
      when 2..5
      @life_points += 50
      @life_points = 100 if @life_points > 100
        puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      when 6
      @life_points += 80
      @life_points = 100 if @life_points > 100
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      end
      end

  

  def compute_damage
    rand(1..6) * @weapon_level
  end


end
