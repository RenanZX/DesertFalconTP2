require 'gosu'
require_relative "GameObject"
require_relative "Sprite"
require_relative "Box"

class Falcon < GameObject
	attr_reader :height
	def initialize(x,y,z)
		@sprite = Sprite.new "falcon.png"
		@shadow = Sprite.new "shadow.png"
		super x, y, z
		@velx = 0
		@vely = 0
		@shadowy = @box.y
		@shadowx = @box.x
		@height = 0
		@minX = 35
		@minY = (480 - 50)
	end

	def update
		if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
			turn_rigth
		elsif Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
			turn_left	
	  	elsif Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_UP
			turn_up
	  	elsif Gosu.button_down? Gosu::KB_DOWN or Gosu::button_down? Gosu::GP_DOWN
			turn_down	
	  	end
	  	move
	end

	def render
		render_shadow
		super
	end

	def notifyColision(gameobject)
		if @height == 0
			return @box.overlapsWith(gameobject)
		end
		return false
	end

	private

	def turn_rigth
		if @box.y < @minY
			@velx = Gosu.offset_x(135, 5)
			@vely = Gosu.offset_y(135, 5)
			@box.x += @velx
			@box.y += @vely
			@shadowx += @velx
			@shadowy += @vely
		end	
	end

	def turn_left
		if @box.x > @minX
			@velx = Gosu.offset_x(315, 5)
			@vely = Gosu.offset_y(315, 5)
			@box.x += @velx
			@box.y += @vely
			@shadowx += @velx
			@shadowy += @vely
		end	
	end

	def turn_up
		if @box.y > 0 && @height < 15
			@vely = Gosu.offset_y(315, 5)
			@box.y += @vely
			@height+=1
		end
	end

	def turn_down
		if @box.y <= @shadowy && @height > 0
			@vely = Gosu.offset_y(315, 5)
			@box.y -= @vely
			@height-=1
		end
	end

	def render_shadow
		@shadow.render(@shadowx, @shadowy)
	end

	def move
		@velx *= 0.75
		@vely *= 0.75
	end
end