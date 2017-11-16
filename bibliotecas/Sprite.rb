require 'gosu'

class Sprite
  attr_accessor :imagem

  def initialize(nomedoArquivo)
    @imagem = Gosu::Image.new("#{__dir__}/media/#{nomedoArquivo}")
  end

  def close; end

  def render(posX = 0, posY = 0, z = 0)
    @imagem.draw(posX, posY, z) unless @imagem.nil?
  end
end
