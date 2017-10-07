require 'gosu'
require_relative "Box"
require_relative "Sprite"


class GameObject
	attr_accessor :box,:sprite

	def initialize(x = 0, y = 0, z = 0)
		height = 0
		width = 0

		if @sprite.class == Sprite.class
			if !@sprite.nil? && !@sprite.imagem.nil?
				height = @sprite.imagem.height
				width = @sprite.imagem.width
			end
		end
			@box = Box.new(x, y, width, height)
	end

	def close
	end

	def update
	end

	def render
		if !@sprite.nil? then
			@sprite.render(@box.x, @box.y)
		end
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