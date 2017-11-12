require 'gosu'

class GameOver
	def initialize
		@game_over = Gosu::Font.new(20)
	end	
	def update
		if Gosu.button_down? Gosu::KB_ENTER
			close!
		end	 
	end
	def draw
		@game_over.draw("GAME  OVER", 170, 150, 0, 3.0, 3.0, Gosu::Color::RED, :additive)
	end	
end		