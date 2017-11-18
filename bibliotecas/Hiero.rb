require 'gosu'
require_relative 'GameObject'
require_relative 'Sprite'
require_relative 'Box'

# Classe que representa a Entidade Hiero, e herda da classe GameObject
class Hiero < GameObject

  # Método construtor da Classe Falcon, a sombra da entidade também é criada
  # @param x - coordenada x da entidade na tela
  # @param y - coordenada y da entidade na tela
  # @param z - altura da entidade
  # @return um novo objeto de Hiero
  def initialize(x, y, z)
    @sprite = Sprite.new 'hiero.png'
    super
  end

  # Método para destruir o Hiero
  def close; end


  # Método que de fato move o objeto de Hiero na tela, alterando suas coordenadas
  def move
    @velx = Gosu.offset_x(225, 1)
    @vely = Gosu.offset_y(225, 1)
    @box.x += @velx
    @box.y += @vely
  end

  # Método que atualiza a posição do Hiero na tela de acordo com comando do usuário
  def update
    move
  end
end
