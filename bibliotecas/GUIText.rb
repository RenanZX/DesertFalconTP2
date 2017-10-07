require 'gosu'

class GUIText #elementos da lista de textos
    attr_accessor :valor
    attr_accessor :color
    attr_accessor :posx
    attr_accessor :posy
    attr_accessor :posz
    attr_accessor :font
    attr_accessor :proximo

    def initialize(texto, posX, posY, color = Gosu::Color::WHITE, font = Gosu::Font.new(20))
        if (font.height > 40 || font.height < 10) 
			font.height = 20
		end

		@font = font
		@valor = texto
		@color = color
		@posx = posX
		@posy = posY
		@posz = 0
    end
end