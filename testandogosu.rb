require 'gosu'

class Player
	def initialize(localsprite)
		@image = Gosu::Image.new(localsprite)
		@x = @y = @vel_x = @vel_y = 0.0
		@angle = 40.0
		@score = 0
		@tamX = 640
		@tamY = 480
	end

	def setDimension(tamx,tamy)
		@tamX = tamx
		@tamY = tamy
	end

	def warp(x , y)
		@x, @y = x, y
	end

	def turn_left
		@vel_x -= Gosu.offset_x(@angle, 0.5)
		@vel_y += Gosu.offset_y(@angle, 0.5)
	end

	def turn_right
		@vel_x += Gosu.offset_x(@angle, 0.5)
		@vel_y -= Gosu.offset_y(@angle, 0.5)
	end

	def turn_down
		@vel_x -= Gosu.offset_x(@angle, 0.5)
		@vel_y -= Gosu.offset_y(@angle, 0.5)
	end

	def turn_up
		@vel_x += Gosu.offset_x(@angle, 0.5)
		@vel_y += Gosu.offset_y(@angle, 0.5)
	end

	def move
		@x += @vel_x
		@y += @vel_y
		@x %= @tamX
		@y %= @tamY

		@vel_x *= 0.95
		@vel_y *= 0.95
		return @x
	end

	def draw
		@image.draw_rot(@x, @y, 1, @angle)
	end
end

class Tela < Gosu::Window
	def initialize(x,y)
		super x,y
		self.caption = "Tela Maneira"
		@background_image = Gosu::Image.new("media/cenario.png")

		@tamX = x
		@tamY = y
		@font = Gosu::Font.new(20)
	end

	def update
    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      @player.turn_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      @player.turn_right
    end
    if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_BUTTON_0
      @player.turn_up
    end
    if Gosu.button_down? Gosu::KB_DOWN
    	@player.turn_down
    end
    	@player.move
  	end

  	def setPlayer(local)
  		@player = Player.new(local)
  		@player.setDimension(@tamX,@tamY)
    	@player.warp(320, 660)
  	end
	
	def draw
		@player.draw
		@background_image.draw(0,0,0)
		@font.draw("MOD TESTE - APERTE ESC PARA SAIR",10,10,0)
	end

	def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end
end

tela = Tela.new(640,480)
tela.setPlayer("media/falcon.png")
tela.show