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

	def overlaps_with(gameobj)
			if !gameobj.nil? && !gameobj.box.nil?
				other_box = gameobj.box
				if (@x < other_box.x + other_box.w &&
					@x + @w > other_box.x &&
					@y < other_box.y + other_box.h &&
					@h + @y > other_box.y) 
					
					return true
				end
			end
		return false
	end
end