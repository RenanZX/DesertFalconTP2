require 'gosu'

class Window < Gosu::Window
	class Elemento
		attr_accessor :valor
		attr_accessor :posx
		attr_accessor :posy
		attr_accessor :posz
		attr_accessor :font
		attr_accessor :proximo
	end

	class List_text
		attr_accessor :primeiro
		attr_accessor :ultimo
	end


	def initialize(dimX,dimY)
		super dimX,dimY
		self.caption = "Desert Ruby"
		@tamX = dimX
		@tamY = dimY
		@lista_t = List_text.new
	end

	def setText(text,x,y)
		novoelemento = Elemento.new
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

	def setBackground(caminhoimagem)
		@background_image = Gosu::Image.new(caminhoimagem)
	end

	def render
	end

	def draw
		if !@background_image.nil?
			@background_image.draw(0,0,0)
		end
		if !@lista_t.primeiro.nil?
			no = @lista_t.primeiro
			while(!no.nil?)
				no.font.draw(no.valor,no.posx,no.posy,no.posz);
				no = no.proximo
			end
		end
	end

	def button_down(id)
		if id == Gosu::KB_ESCAPE
			close
		else
			super
		end
	end
end