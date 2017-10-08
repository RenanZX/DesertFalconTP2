require 'gosu'
require_relative "Box"
require_relative "Sprite"


class GameObject
	attr_accessor :box, :sprite, :z

	def initialize(x = 0, y = 0, z = 0)
		height = 0
		width = 0
		@z = z
		if (!@sprite.nil?)
			if (!@sprite.imagem.nil?)
				height = @sprite.imagem.height
				width = @sprite.imagem.width
			end
		end
		@box = Box.new(x, y, width, height)
		@pixelsHeight = 40;
	end

	def close
	end

	def update
	end

	def render
		trueY = @box.y - (z * @pixelsHeight)
		@sprite.render(@box.x, trueY)
	end

	def isEqual(gameobj)
		if self == gameobj
			return true
		end
		return false
	end

	def isDead
	end

	def notity_colision(gameobj)
		if (@z == gameobj.z)
			return @box.overlaps_with gameobj
		end

		return false
	end
end
