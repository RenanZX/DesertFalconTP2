require 'gosu'

module ZOrder
	BACKGROUND, HIERO, PLAYER, UI = *0..3
end

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

	def score
    	@score
  	end

  	def collect_hieros(hieros)
    	hieros.reject! { |hiero| Gosu.distance(@x, @y, hiero.x, hiero.y) < 35 }
  	end
end

class Hiero
	attr_reader :x,:y
	def initialize(animation)
		@animation = animation
		@color = Gosu::Color::BLACK.dup
		@color.red = rand(256 - 40) + 40
    	@color.green = rand(256 - 40) + 40
    	@color.blue = rand(256 - 40) + 40
    	@x = rand * 640
    	@y = rand * 480
	end

	def draw
		img = @animation[Gosu.milliseconds / 100 % @animation.size]
    	img.draw(@x - img.width / 2.0, @y - img.height / 2.0,
        ZOrder::HIERO, 1, 1, @color, :add)
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
    	@player.collect_hieros(@hieros)

    	if rand(100) < 4 and @hieros.size < 25
    		@hieros.push(Hiero.new(@hiero_img))
    	end
  	end

  	def setPlayer(local)
  		@player = Player.new(local)
  		@player.setDimension(@tamX,@tamY)
    	@player.warp(320, 660)
  	end

  	def setHieros(local)
  		@hiero_img = Gosu::Image.load_tiles(local,25,25)
  		@hieros = Array.new
  	end
	
	def draw
		@player.draw
		@hieros.each { |hiero| hiero.draw }
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
tela.setHieros("media/star.png")
tela.setPlayer("media/falcon.png")
tela.show