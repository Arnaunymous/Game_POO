require 'pry'


class Player #a
  attr_accessor :name, :life_points

  def initialize(name)
	 @name = name
	 @life_points = 10
  end

  def show_state #b
	 puts "#{name} a #{life_points} points de vie"
  end

  def gets_damage(damage) #c
	 @damage = damage
	 @life_points = @life_points - @damage
	 if @life_points <= 0 
#Si le niveaux de vie est égal ou inférieur à 0, le joueur est considéré comme mort
		puts "le joueur #{name} a été tué" #Un message s'affiche
	 end
  end

  def attacks(player)
  	  puts "le joueur #{name} attaque le joueur #{player.name}"
  	  damage = compute_damage
  	  puts "il lui inflige #{damage} points de dommages"
  	  player.gets_damage(damage)
  end

  def compute_damage
  	return rand(1..6)
  end
end
class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
  	@weapon_level = 1
  	super(name) #ATTENTION à l'emplacement du super dans l'initialize, pour une modification effective, le life_points doit être mis aprés
  	@life_points = 100

  end
  def show_state
  	puts "#{name} a #{life_points} points de vie et une arme de niveaux #{weapon_level}"
  end
  def compute_damage
  	rand(1..6) * @weapon_level
  end
  def search_weapon
  	return rand(1..6)
  end
  def exchange_weapon
  	new_weapon_level = search_weapon
  	puts "Tu as trouvé une arme de niveau #{new_weapon_level} " 
  	if new_weapon_level > weapon_level
  		 @weapon_level = new_weapon_level
  		puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
  	else
  		puts "Merde, elle nest pas mieux que ton arme actuelle..."
  	end
  end

  def search_health_pack
  	health_pack = rand(1..6)
  	if health_pack == 1 
  	puts "Tu n'as rien trouvé"
  	elsif health_pack == 6
  		@life_points = life_points + 80
  		if life_points > 100 
  			@life_points = 100
  		end
  	puts "Woaw, tu as trouvé un pack de +80 points de vie !"
    else 
    	@life_points = life_points + 50
  		if life_points > 100 
  			@life_points = 100
  		end
  	puts "Woaw, tu as trouvé un pack de +50 points de vie !"
    end
  end


end

binding.pry