require 'gosu'
require_relative "bibliotecas/Janela"
require_relative "bibliotecas/Hiero"
require_relative "bibliotecas/Falcon"
require_relative "bibliotecas/GUIText"

class Mygame
	def initialize sizeX,sizeY
		@tamX = sizeX
		@tamY = sizeY
	end

	def executar
		window = Window.new(@tamX,@tamY) #define o tamanho da tela
		window.set_background("cenario.png")

		for i in 0..100 #insere os hieros
			$x = Random.new.rand(0..@tamX)
			$k = Random.new.rand(0..@tamY)
			hiero = Hiero.new($k,$x,0)
			window.add_hiero(hiero)
		end

		gui_text = GUIText.new("Aperte 'ESC' para sair", 10, 10, Gosu::Color::GREEN)
		window.add_gui_text(gui_text)
		window.show
	end
end

Mygame.new(640,480).executar