require 'gosu'
require_relative "GameObject"
require_relative "Sprite"
require_relative "Box"

class Falcon < GameObject
	def initialize(x,y,z)
		@sprite = Sprite.new "falcon.png"
		@shadow = Sprite.new "shadow.png"
		@velx = 0
		@vely = 0

		@minX = 35
		@minY = (480 - 50)
		
		super
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
		  
		move
	end

	def render
		render_shadow
		super
	end

	private 
		def rigth()
			if  @box.y < @minY
				@velx = Gosu.offset_x(135, 5)
				@vely = Gosu.offset_y(135, 5)
			end	
		end

		def left()
			if @box.x > @minX
				@velx = Gosu.offset_x(315, 5)
				@vely = Gosu.offset_y(315, 5)
			end	
		end

		def up()
			if(@z < 2)
				@z += 1
			end	
		end

		def down()
			if(@z > 0)
				@z -=1
			end	
		end

		def move 
			@box.x += @velx
			@box.y += @vely

			@velx *= 0.75
			@vely *= 0.75	
		end

		def render_shadow
			@shadow.imagem.draw(@box.x, @box.y, 0)
		end	
end