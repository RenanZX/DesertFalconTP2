require 'gosu'
require_relative "Box"
require_relative "Sprite"


class GameObject
	attr_reader :box,:sprite,:arr_gameobj

	def initialize
	end

	def close
	end

	def update
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