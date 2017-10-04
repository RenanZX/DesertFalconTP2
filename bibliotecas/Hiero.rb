require 'gosu'
require_relative "GameObject"
require_relative "Sprite"

class Hiero < GameObject
	def initialize(x,y,z)
		@hero = Sprite.new("hiero.png")
		@x, @y, @z = x, y, z
		@hero.setGameObject(self)
	end

	def move
		@velx = Gosu.offset_x(225, 1)
		@vely = Gosu.offset_y(225, 1)
		@x += @velx
		@y += @vely 
	end

	def update
		if !@hero.nil?
			move
			@hero.setGameObject(self)
			@hero.render
		end
	end

	def notifyColision(gameobject)
		if Gosu.distance(@x,@y,gameobject.x,gameobject.y) < 35
			return true
		end
		return false
	end
end