require 'gosu'

class GUIText # elementos da lista de textos
  attr_accessor :valor
  attr_accessor :color
  attr_accessor :posx
  attr_accessor :posy
  attr_accessor :posz
  attr_accessor :font

  def initialize(texto, posX, posY, color = Gosu::Color::WHITE, tamfont = 20, espec = 1)
    tamfont = 20 if tamfont > 40 || tamfont < 10

    @font = Gosu::Font.new(tamfont)
    @valor = texto
    @color = color
    @posx = posX
    @posy = posY
    @posz = 0
    @especura = espec
  end

  def draw
    @font.draw(@valor, @posx, @posy, @posz, @especura, @especura, @color)
  end
end
