require 'gosu'
load "GameObject"
load "Sprite"

class Box
	def initialize(x,y,h,w)
		@objeto = GameObject.new
		@x, @y, @h, @w = x, y, h, w
	end

	def setSprite(sprite)
		@sprite = sprite
		@sprite.setGameObject(@objeto)
	end

	def close
	end

	def overlapsWith(gameobj)
	end
end