require 'gosu'

class GameObject
	attr_reader :x,:y,:z

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