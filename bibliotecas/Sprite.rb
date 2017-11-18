require 'gosu'

# Classe que representa a Sprite do jogo
class Sprite

  # Método de acesso para :imagem
  attr_accessor :imagem

  # Método construtor da classe Sprite
  # @param nomedoArquivo [String] nome do arquivo da imagem que será desenhada
  def initialize(nomedoArquivo)
    @imagem = Gosu::Image.new("#{__dir__}/media/#{nomedoArquivo}")
  end

  # Método destrutor da classe Sprite
  def close; end

  # Método que renderiza a Sprite na tela
  # @param posX [Numeric] coordenada x de onde a imagem será renderizada na tela
  # @param posY [Numeric] coordenada y de onde a imagem será renderizada na tela
  # @param z [Numeric] coordenada z de onde a imagem será renderizada na tela
  def render(posX = 0, posY = 0, z = 0)
    @imagem.draw(posX, posY, z) unless @imagem.nil?
  end
end
