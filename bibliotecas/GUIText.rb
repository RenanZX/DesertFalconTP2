require 'gosu'

#Classe que representa os textos de interface com usuario na tela
class GUIText 
  # Elementos da lista de textos
  
  # Métodos set e get dos elementos da lista
  attr_accessor :valor
  attr_accessor :color
  attr_accessor :posx
  attr_accessor :posy
  attr_accessor :posz
  attr_accessor :font

  # Método construtor da classe GUIText
  # @param texto [String] texto que será escrito na tela
  # @param posX [Numeric] coordenada x onde o texto será escrito na tela
  # @param posY [Numeric] coordenada y onde o texto será escrito na tela
  # @param color [Gosu::Color] cor do texto que será escrito na tela
  # @param tamfont [Numeric] tamanho da fonte do texto que será escrito na tela
  # @param espec [Numeric] espessura do texto que será escrito na tela
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

  #Método que de fato escreve o texto na tela
  def draw
    @font.draw(@valor, @posx, @posy, @posz, @especura, @especura, @color)
  end
end
