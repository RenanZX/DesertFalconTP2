require 'gosu'
require_relative "bibliotecas/Janela"
require_relative "bibliotecas/Hiero"
require_relative "bibliotecas/Falcon"

class Mygame
	def initialize height,width
		@height, @width = height, width
	end

	def executar
		window = Window.new(@height,@width) #define o tamanho da tela
		window.setBackground("cenario.png") #insere o cenario
		for i in 0..100 #insere os hieros
			$x = Random.new.rand(0..@height*10)
			$k = Random.new.rand(0..@width)
			hiero = Hiero.new($k,$x,0)
			window.add_hiero(hiero)
		end
		window.setText("Aperte 'ESC' para sair",10,10,Gosu::Color::GREEN) #seta um texto novo na tela(e possivel configurar a cor da tela ou nao)
		window.show #mostra a tela
	end
end

Mygame.new(640,480).executar