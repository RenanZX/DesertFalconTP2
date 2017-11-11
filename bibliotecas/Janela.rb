require 'gosu'
require_relative "Falcon"
require_relative "Hiero"
require_relative "Menu"

class Window < Gosu::Window #classe janela
	MENU = 0
	JOGO = 1
	PLACAR = 2
	PONTO = 3
	def initialize(largura, altura) #inicializa a janela recebendo as dimensões como parametro
		super largura, altura
		self.caption = "Desert Ruby" #titulo da janela

		@lista_hieros = Array.new()
		falconX = 80
		falconY = altura - 150
		falconZ = 0
		@player = Falcon.new(falconX, falconY, falconZ)
		@list_gui_text = Array.new
		@menu = Menu.new
		@estado = MENU
		initialize_menu
	end

	#seta textos na janela recebendo a posicao juntamente com o texto como parametro
	def add_gui_text(gui_text) 
		@list_gui_text << gui_text
	end

	def update
		case @estado #prototipo ainda em desenvolvimento
		when MENU #verifica o estado da janela
			valor = @menu.update
			if valor == "Jogar" then #verifica a opcao que o usuario escolheu
				@estado = JOGO
			elsif valor == "Placar" then
				@estado = PLACAR
			elsif valor == "Pontuacao" then
				@estado = PONTO
			elsif valor == "Sair" then
				close
			end
		when JOGO
			@player.update

			@lista_hieros.each do |hiero|
				hiero.update
			end

			calculate_colisions
			remove_unecessary_objs
		when PLACAR

		when PONTO

		end
	end

	def set_background(nomearquivo) #recebe um nome de um arquivo de imagem e o coloca como fundo da tela
		@imagem_fundo = Gosu::Image.new("#{File.expand_path(File.dirname(__FILE__))}/media/#{nomearquivo}")
	end

	def add_hiero hiero
		@lista_hieros << hiero
	end

	def draw #desenha os objetos na tela
		case @estado
		when MENU
			@menu.draw
		when JOGO
			if (!@imagem_fundo.nil?)
				@imagem_fundo.draw(0,0,0)
			end
		
			@lista_hieros.each do |hiero|
				hiero.render 
			end

			draw_text

			@player.render
		when PLACAR

		when PONTO

		end
	end

	def button_down(id) #identifica os botoes que sao apertados pelo usuario
		if id == Gosu::KB_ESCAPE
			close
		else
			super
		end
	end

	private 
		attr_accessor :estado,:save_position_menu

		def initialize_menu
			margem_item = 220
			posicaomenu = 250

			menuopcao = GUIText.new("Jogar", posicaomenu, margem_item)
			@menu.add_item(menuopcao,true)
			margem_item+=20
			menuopcao = GUIText.new("Placar", posicaomenu, margem_item)
			@menu.add_item(menuopcao)
			margem_item+=20
			menuopcao = GUIText.new("Pontuacao", posicaomenu, margem_item)
			@menu.add_item(menuopcao)
			margem_item+=20
			menuopcao = GUIText.new("Sair", posicaomenu, margem_item)
			@menu.add_item(menuopcao)
		end

		def draw_text
			@list_gui_text.each do |item|
				item.font.draw(item.valor, item.posx, item.posy, item.posz, 1, 1, item.color)
			end
		end

		def calculate_colisions
			i = 0
			while i < @lista_hieros.length do
				if (@player.notity_colision @lista_hieros[i])
					@lista_hieros.delete_at i
				end

				i +=1
			 end
		end

		def remove_unecessary_objs
			i = 0
			while i < @lista_hieros.length do
				hiero = @lista_hieros[i]

				if hiero.box.x < -20
					@lista_hieros.delete_at i
				end

				i +=1
			end
		end
end