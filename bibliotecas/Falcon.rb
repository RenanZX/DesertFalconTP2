require 'gosu'
require_relative "GameObject"
require_relative "Sprite"

class Falcon < GameObject
	def initialize(x,y,z)
		@player = Sprite.new("falcon.png")
		@x, @y, @z = x, y, z
		@height = 2
		@angulo = 45
		@player.setGameObject(self)
		@areah , @areaw = 640, 480
	end

	def turn_left
		@x -= Gosu.offset_x(@angulo, 4.5)
		@y += Gosu.offset_y(@angulo, 4.5)
	end

	def turn_right
		@x += Gosu.offset_x(@angulo, 4.5)
		@y -= Gosu.offset_y(@angulo, 4.5)
	end

	def turn_down
		if(@height > 0)
			@height -=1
		end
	end

	def turn_up
		if(@height < 2)
			@height += 1
		end
	end

	def setAreaWindow(h,w)
		@areah = h
		@areaw = w
	end

	def update
		if (Gosu.button_down? Gosu::KB_LEFT) && ((@x > -2.95)&&(@y > -2.95))
    	  	turn_left
    	end
    	if (Gosu.button_down? Gosu::KB_RIGHT) && ((@x <= 0.93*@areah)&&(@y <= 0.93*@areaw))
      		turn_right
    	end
    	if (Gosu.button_down? Gosu::KB_UP) && ((@x <= 0.93*@areah)&&(@y > -2.95))
    		turn_up
    	end
    	if (Gosu.button_down? Gosu::KB_DOWN) && ((@x > -2.95)&&(@y <= 0.93*@areaw))
    		turn_down
    	end
    	@player.setGameObject(self)
    	@player.draw_shadow(@x,@y,@height)
    	@player.render
	end

	def notifyColision(gameobject)
		if Gosu.distance(@x,@y,gameobject.x,gameobject.y) < 35
			return true
		end
		return false
	end
end