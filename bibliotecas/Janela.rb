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
		@list_gui_text = Array.new
	end

	#seta textos na janela recebendo a posicao juntamente com o texto como parametro
	def add_gui_text(gui_text) 
		@list_gui_text << gui_text
	end

	def update
		@player.update

		@lista_hieros.each do |hiero|
			hiero.update
		end

		calculate_colisions
	end

	def set_background(nomearquivo) #recebe um nome de um arquivo de imagem e o coloca como fundo da tela
		@imagem_fundo = Gosu::Image.new("#{File.expand_path(File.dirname(__FILE__))}/media/#{nomearquivo}")
	end

	def add_hiero hiero
		@lista_hieros << hiero
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
			@list_gui_text.each do |item|
				item.font.draw(item.valor, item.posx, item.posy, item.posz, 1, 1, item.color)
			end
		end

		def calculate_colisions
			$i = 0
			while $i < @lista_hieros.length do
				if (@player.notity_colision @lista_hieros[$i])
					@lista_hieros.delete_at $i
				end

				$i +=1
			 end
		end


end