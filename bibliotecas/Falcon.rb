require 'gosu'
require_relative "GameObject"
require_relative "Sprite"
require_relative "Box"

class Falcon < GameObject
	def initialize(x,y,z)
		@box = Box.new(x,y,640,480)
		@box.setSprite("falcon.png")
		@shadow = Box.new(x,y+10,640,480)
		@shadow.setSprite("shadow.png")
		@angulo = 45
	end

	def turn_left
		@box.x -= Gosu.offset_x(@angulo, 4.5)
		@box.y += Gosu.offset_y(@angulo, 4.5)
		@shadow.x -= Gosu.offset_x(@angulo, 4.5)
		@shadow.y += Gosu.offset_y(@angulo, 4.5)
	end

	def turn_right
		@box.x += Gosu.offset_x(@angulo, 4.5)
		@box.y -= Gosu.offset_y(@angulo, 4.5)
		@shadow.x += Gosu.offset_x(@angulo, 4.5)
		@shadow.y -= Gosu.offset_y(@angulo, 4.5)
	end

	def turn_down
		if @box.y < @shadow.y
			@box.y -= Gosu.offset_y(@angulo, 4.5)
		end
	end

	def turn_up
		@box.y += Gosu.offset_y(@angulo, 4.5)
	end

	def setAreaWindow(height,width)
		@box.h = height
		@box.w = width
		@shadow.h = height
		@shadow.w = width
	end

	def update
		if (Gosu.button_down? Gosu::KB_LEFT) && ((@box.x > -2.95)&&(@box.y > -2.95))&&((@shadow.x > -2.95)&&(@shadow.y > -2.95))
    	  	turn_left
    	end
    	if (Gosu.button_down? Gosu::KB_RIGHT) && ((@box.x <= 0.93*@box.h)&&(@box.y <= 0.93*@box.w))&&((@shadow.x <= 0.93*@shadow.h)&&(@shadow.y <= 0.93*@shadow.w))
      		turn_right
    	end
    	if (Gosu.button_down? Gosu::KB_UP) && ((@box.x <= 0.93*@box.h)&&(@box.y > -2.95))
    		turn_up
    	end
    	if (Gosu.button_down? Gosu::KB_DOWN) && ((@box.x > -2.95)&&(@box.y <= 0.93*@box.w))
    		turn_down
    	end
    	@shadow.updateBox
    	@box.updateBox
	end

	def notifyColision(gameobject)
		return @box.overlapsWith(gameobject)
	end
end