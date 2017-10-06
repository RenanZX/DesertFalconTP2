require 'gosu'
require_relative "Box"
require_relative "Sprite"


class GameObject
	attr_accessor :box,:sprite,:arr_gameobj

	def initialize(x = 0, y = 0, z = 0)
		height = 0
		width = 0

		if (!@sprite.nil?)
			if (!@sprite.imagem.nil?)
				height = @sprite.imagem.height
				width = @sprite.imagem.width
			end
		end
		@box = Box.new(x, y, width, height)
	end

	def sprite=(strimg)
		@sprite = Sprite.new(strimg)
	end

	def close
	end

	def update
	end

	def render
		@sprite.render(@box.x, @box.y)
	end

	def isEqual(gameobj)
		if self == gameobj
			return true
		end
		return false
	end

	def isDead
	end

	def notifyColision(gameobj)
	end
end