require 'gosu'
require_relative "Falcon"
require_relative "Hiero"

class Window < Gosu::Window #classe janela
	def initialize(largura, altura) #inicializa a janela recebendo as dimensões como parametro
		super largura, altura
		self.caption = "Desert Ruby" #titulo da janela

		@lista_hieros = Array.new()
		falconX = 80
		falconY = altura - 150
		falconZ = 0
		@player = Falcon.new(falconX, falconY, falconZ)
		@lista_textos = Array.new #cria duas listas uma para as caixas de texto e outra pros objetos do jogo
	end

	#seta textos na janela recebendo a posicao juntamente com o texto como parametro
	def add_gui_text(gui_text) 
		@lista_textos << gui_text
	end

	def update
		@player.update

		@lista_hieros.each do |hiero|
			hiero.update
		end
	end

	def set_background(nomearquivo) #recebe um nome de um arquivo de imagem e o coloca como fundo da tela
		@imagem_fundo = Gosu::Image.new("#{File.expand_path(File.dirname(__FILE__))}/media/#{nomearquivo}")
	end

	def add_hiero hiero
		@lista_hieros << hiero
	end

	def setPlayer(player)
		novoelemento = Elemento_obj.new
		novoelemento.gameobj = GameObject.new
		novoelemento.gameobj = player
		if @players.ultimo.nil?
			@players.ultimo = novoelemento
		else
			@players.ultimo.proximo = novoelemento
			@players.ultimo = novoelemento
		end

		if @players.primeiro.nil?
			@players.primeiro = novoelemento
		end
	end

	def draw #desenha os objetos na tela
		if (!@imagem_fundo.nil?)
			@imagem_fundo.draw(0,0,0)
		end
		
		@lista_hieros.each do |hiero|
			hiero.render 
		end

		draw_text

		@player.render


	end

	def button_down(id) #identifica os botoes que sao apertados pelo usuario
		if id == Gosu::KB_ESCAPE
			close
		else
			super
		end
	end

	private 
		def draw_text
			@lista_textos.each do |item|
				item.font.draw(item.valor, item.posx, item.posy, item.posz, 1, 1, item.color)
			end
		end
end