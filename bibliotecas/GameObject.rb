require 'gosu'
require_relative 'Box'
require_relative 'Sprite'

# Classe que engloba objetos renderizados na tela
class GameObject
  # Métodos de acesso (set e get) para (:box, :sprite, :z)
  attr_accessor :box, :sprite, :z

  # Método construtor da classe GameObject
  # @param x [Numeric] coordenada x do GameObject na tela
  # @param y [Numeric] coordenada y do GameObject na tela
  # @param z [Numeric] coordenada z do GameObject na tela
  # @return [GameObject] novo objeto da classe GameObject
  def initialize(x = 0, y = 0, z = 0)
    height = 0
    width = 0
    @z = z
    unless @sprite.nil?
      unless @sprite.imagem.nil?
        height = @sprite.imagem.height
        width = @sprite.imagem.width
      end
    end
    @box = Box.new(x, y, width, height)
    @pixelsHeight = 40
  end

  # Método destrutor da classe GameObject usada para tirar o objeto da tela
  def close; end

  # Método para atualizar a posição de um GameObject na tela
  def update; end

  # Método para renderizar um GameObject na tela
  def render
    trueY = @box.y - (z * @pixelsHeight)
    @sprite.render(@box.x, trueY)
  end

  # Método para verificar se um GameObject é igual a outro GameObject
  # @param gamebj [GameObject] o GameObject que deseja verificar se é igual
  # @return [bool] true se ambos GameObject's são iguais. false caso contrário
  def isEqual(gameobj)
    return true if self == gameobj
    false
  end

  # Método que verifica se o GameObject morreu
  # @return [bool] true se o GameObject morreu. false caso contrário
  def isDead; end

  # Método que verifica se houve colisão com outro GameObject
  # @param gameobj [GameObject] GameObject que será comparado
  # @return  [bool] true se houve colisão. false caso contrário
  def notity_colision(gameobj)
    return @box.overlaps_with gameobj if @z == gameobj.z

    false
  end
end
