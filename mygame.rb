require 'gosu'
require_relative "bibliotecas/Janela"
require_relative "bibliotecas/Hiero"
require_relative "bibliotecas/Falcon"
require_relative "bibliotecas/GUIText"
require_relative "bibliotecas/Enemy"
class Mygame
	def initialize sizeX,sizeY
		@tamX = sizeX
		@tamY = sizeY
	end

	def executar
		window = Window.new(@tamX,@tamY) #define o tamanho da tela
		window.set_background("cenario.png")
		gui_text = GUIText.new("Aperte 'ESC' para sair do jogo", 10, 10, Gosu::Color::WHITE)
		window.add_gui_text(gui_text)
		window.show
	end
end

Mygame.new(640,480).executar