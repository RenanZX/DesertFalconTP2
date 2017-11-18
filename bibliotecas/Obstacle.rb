require 'gosu'
require_relative 'GameObject'
require_relative 'Sprite'
require_relative 'Box'

# Classe que representa os obstáculos
class Obstacle < GameObject

  # Método construtor da classe Obstáculo
  # @param x [Numeric] coordenada x onde o obstáculo será desenhado na tela
  # @param y [Numeric] coordenada y onde o obstáculo será desenhado na tela
  # @param z [Numeric] coordenada z onde o obstáculo será desenhado na tela
  def initialize(x, y, z)
    @sprite = Sprite.new 'obstacle.png'
    super
  end

  # Método de manipulação do movimento do obstáculo
  def move
    @velx = Gosu.offset_x(225, 1)
    @vely = Gosu.offset_y(225, 1)
    @box.x += @velx
    @box.y += @vely
  end

  # Método que atualiza a movimentação do obstáculo
  def update
    move
  end
end
