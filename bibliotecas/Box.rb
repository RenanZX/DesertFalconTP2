require 'gosu'
require_relative "Sprite"
require_relative "GameObject"

class Box
	attr_accessor :x,:y,:h,:w
	def initialize(x,y,h,w)
		@x, @y, @h, @w = x, y, h, w
	end

	# def x=(posx)
	# 	@x = posx
	# end

	# def x
	# 	return @x
	# end

	# def y=(posy)
	# 	@y = posy
	# end

	# def y
	# 	return @y
	# end

	# def h=(posh)
	# 	@h = posh
	# end

	# def h
	# 	return @h
	# end

	# def w=(posw)
	# 	@w = posw
	# end

	# def w
	# 	return @w
	# end

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

	def updateBox
		if !@sprite.nil?
			@sprite.setPosition(@x,@y,0)
			@sprite.render
		end
	end

	def setSprite(stringsprite)
		@sprite = Sprite.new(stringsprite)
	end
end