require 'gosu'
require_relative "Sprite"
require_relative "GameObject"

class Box
	attr_accessor :x,:y,:h,:w
	def initialize(x,y,h,w)
		@x, @y, @h, @w = x, y, h, w
	end

	def close
	end

	def overlapsWith(gameobj)
			if !gameobj.nil? && !gameobj.box.nil? then
				if Gosu.distance(@x,@y,gameobj.box.x,gameobj.box.y) < 35
					return true
				end
			end
		return false
	end
end