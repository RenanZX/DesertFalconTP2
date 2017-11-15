require 'gosu'

class GameOver
	def initialize
		@game_over = GUIText.new("GAME OVER",170,150,Gosu::Color::RED,20,3.0)
		@continue = GUIText.new("Pressione Enter para conitinuar",280, 420)
	end	
	def update
		if Gosu.button_down? Gosu::KB_ENTER or Gosu.button_down? Gosu::KB_RETURN
			sleep 0.15
			return true
		end	 
	end
	def draw
		@game_over.draw
		@continue.draw
	end	
end		