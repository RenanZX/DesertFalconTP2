require 'gosu'

class GameOver
	def initialize
		@game_over = GUIText.new("GAME OVER",170,150,Gosu::Color::RED,20,3.0)
	end	
	def update
		if Gosu.button_down? Gosu::KB_ENTER or Gosu.button_down? Gosu::KB_BACKSPACE
			sleep 0.15
			return true
		end	 
	end
	def draw
		@game_over.draw
	end	
end		