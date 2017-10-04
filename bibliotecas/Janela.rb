require 'gosu'
require_relative "Falcon"
require_relative "Hiero"

class Window < Gosu::Window #classe janela
	class Elemento_txt #elementos da lista de textos
		attr_accessor :valor
		attr_accessor :posx
		attr_accessor :posy
		attr_accessor :posz
		attr_accessor :font
		attr_accessor :proximo
	end

	class Elemento_obj #elementos da lista de objetos do jogo
		attr_accessor :gameobj
		attr_accessor :proximo
	end

	class List #lista
		attr_accessor :primeiro
		attr_accessor :ultimo
	end


	def initialize(dimX,dimY) #inicializa a janela recebendo as dimensões como parametro
		super dimX,dimY
		self.caption = "Desert Ruby" #titulo da janela
		@tamX = dimX #dimensoes da janela
		@tamY = dimY
		@lista_t = List.new #cria duas listas uma para as caixas de texto e outra pros objetos do jogo
		@game_obj = List.new
	end

	def setText(text,x,y) #seta textos na janela recebendo a posicao juntamente com o texto como parametro
		novoelemento = Elemento_txt.new #encadeia em uma lista
		novoelemento.font = Gosu::Font.new(20)
		novoelemento.posx = x
		novoelemento.posy = y
		novoelemento.posz = 0
		novoelemento.valor = text
		if @lista_t.ultimo.nil?
			@lista_t.ultimo = novoelemento
		else
			@lista_t.ultimo.proximo = novoelemento
			@lista_t.ultimo = novoelemento
		end

		if @lista_t.primeiro.nil?
			@lista_t.primeiro = novoelemento
		end
	end

	def update

	end

	def setBackground(nomearquivo) #recebe um nome de um arquivo de imagem e o coloca como fundo da tela
		@imagem_fundo = Gosu::Image.new("#{File.expand_path(File.dirname(__FILE__))}/media/#{nomearquivo}")
	end

	def setGameObject(gameobj) #recebe e seta um objeto do jogo como parametro na janela
		novoelemento = Elemento_obj.new
		novoelemento.gameobj = GameObject.new
		novoelemento.gameobj = gameobj
		if @game_obj.ultimo.nil?
			@game_obj.ultimo = novoelemento
		else
			@game_obj.ultimo.proximo = novoelemento
			@game_obj.ultimo = novoelemento
		end

		if @game_obj.primeiro.nil?
			@game_obj.primeiro = novoelemento
		end
	end

	def render
	end

	def draw #desenha os objetos na tela
		if !@imagem_fundo.nil?
			@imagem_fundo.draw(0,0,0)
		end
		if !@lista_t.primeiro.nil?
			no = @lista_t.primeiro
			while(!no.nil?)
				no.font.draw(no.valor,no.posx,no.posy,no.posz);
				no = no.proximo
			end
		end
		if !@game_obj.primeiro.nil?
			no = @game_obj.primeiro
			while(!no.nil?)
				no.gameobj.update
				no = no.proximo
			end
		end
	end

	def button_down(id) #identifica os botoes que sao apertados pelo usuario
		if id == Gosu::KB_ESCAPE
			close
		else
			super
		end
	end
end