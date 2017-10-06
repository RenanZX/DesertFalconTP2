require 'gosu'
require_relative "GameObject"
require_relative "Sprite"
require_relative "Box"

class Falcon < GameObject
	def initialize(x,y,z)
		@sprite = Sprite.new("shadow.png")
		@shadow.setSprite("shadow.png")
		super (x, y, z)
	end

	def update
		if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
			rigth()
		elsif Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
			left()	
	  	elsif Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_UP
			up()
	  	elsif Gosu.button_down? Gosu::KB_DOWN or Gosu::button_down? Gosu::GP_DOWN
			down()	
	  	end
	end

	def notifyColision(gameobject)
		return @box.overlapsWith(gameobject)
	end

	private 
		def rigth()
			if @y < 435
				@velx = Gosu.offset_x(135, 5)
				@vely = Gosu.offset_y(135, 5)
			end	
		end

		def left()
			if @y > 35
				@velx = Gosu.offset_x(315, 5)
				@vely = Gosu.offset_y(315, 5)
			end	
		end

		def up()
			if(@height < 2)
				@height += 1
			end	
		end

		def down()
			if(@height > 0)
				@height -=1
			end	
		end

		def move 
			@box.x += @velx
			@box.y += @vely

			@velx *= 0.75
			@vely *= 0.75	
		end

		def draw_shadow
			@sprite.draw_shadow(@x, @y, @height)
		end	
end