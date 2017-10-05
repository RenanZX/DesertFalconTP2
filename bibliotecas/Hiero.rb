require 'gosu'
require_relative "GameObject"
require_relative "Sprite"
require_relative "Box"

class Hiero < GameObject
	def initialize(x,y,z)
		@box = Box.new(x,y,640,480)
		@box.setSprite("hiero.png")
	end

	def close
	end

	def move
		@velx = Gosu.offset_x(225, 1)
		@vely = Gosu.offset_y(225, 1)
		@box.x += @velx
		@box.y += @vely
	end

	def update
		move
		if !@box.nil?
			@box.updateBox
		end
	end

	def notifyColision(gameobject)
		return @box.overlapsWith(gameobject)
	end
end