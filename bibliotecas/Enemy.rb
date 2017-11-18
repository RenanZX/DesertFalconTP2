require 'gosu'
require_relative 'GameObject'
require_relative 'Sprite'
require_relative 'Box'

#Classe que representa a entidade Enemy herda de GameObject
class Enemy < GameObject

  # Método construtor Enemy
  # @param x [Numeric] - coordenada x para desenhar na tela
  # @param y [Numeric] - coordenada y para desenhar na tela
  # @param z [Numeric] - coordenada z para desenhar na tela
  def initialize(x, y, z)
    @sprite = Sprite.new 'enemy.png'
    @shadow = Sprite.new 'shadow_enemy.png'
    super
  end

  # Método de manipulação dos movimentos de objetos de Enemy
  def move
    @velx = Gosu.offset_x(225, 3)
    @vely = Gosu.offset_y(225, 3)
    @box.x += @velx
    @box.y += @vely
  end

  # Método que faz update em relação a movimentação do objeto de Enemy
  def update
    move
  end

  #Método que renderiza o objeto de Enemy na tela
  def render
    render_shadow if @z != 0
    super
  end

  private

  #Método que renderiza a sombra do objeto de Enemy na tela
  def render_shadow
    @shadow.imagem.draw(@box.x, @box.y, 0)
  end
end
