require 'gosu'
require_relative 'GameObject'
require_relative 'Sprite'
require_relative 'Box'

# Entidade que representa o Falcon do jogo
class Falcon < GameObject

  # Método construtor da Classe Falcon, a sombra da entidade também é criada
  # @param x [Numeric] - coordenada x da entidade na tela
  # @param y [Numeric] - coordenada y da entidade na tela
  # @param z [Numeric] - altura da entidade
  # @return [GameObject] um novo objeto de Falcon
  def initialize(x, y, z)
    @sprite = Sprite.new 'falcon.png'
    @shadow = Sprite.new 'shadow.png'
    @velx = 0
    @vely = 0
    @velz = 0

    @minX = 35
    @minY = (480 - 50)

    super
  end

  # Método que atualiza a posição do Falcon na tela de acordo com comando do usuário
  def update
    if Gosu.button_down?(Gosu::KB_RIGHT) || Gosu.button_down?(Gosu::GP_RIGHT)
      rigth
    elsif Gosu.button_down?(Gosu::KB_LEFT) || Gosu.button_down?(Gosu::GP_LEFT)
      left
    elsif Gosu.button_down?(Gosu::KB_UP) || Gosu.button_down?(Gosu::GP_UP)
      up
    elsif Gosu.button_down?(Gosu::KB_DOWN) || Gosu.button_down?(Gosu::GP_DOWN)
      down
    end

    move
  end

  # Renderiza o objeto da entidade Falcon na tela, além da sua sombra
  def render
    render_shadow
    super
  end

  private

  # Método de manipulação do objeto de Falcon. Move para a direita
  def rigth
    if @box.y < @minY
      @velx = Gosu.offset_x(135, 5)
      @vely = Gosu.offset_y(135, 5)
    end
  end

  # Método de manipulação do objeto de Falcon. Move para a esquerda
  def left
    if @box.x > @minX
      @velx = Gosu.offset_x(315, 5)
      @vely = Gosu.offset_y(315, 5)
    end
  end

  # Método de manipulação do objeto de Falcon. Move para cima
  def up
    @velz = Gosu.offset_y(100, 1)
    @z += @velz if @z < 2
  end

  # Método de manipulação do objeto de Falcon. Move para baixo
  def down
    @velz = Gosu.offset_y(100, 1)
    @z -= @velz if @z > 0
  end

  # Método que de fato move o objeto de Falcon na tela, alterando suas coordenadas
  def move
    @box.x += @velx
    @box.y += @vely

    @velx *= 0.75
    @vely *= 0.75
    @velz *= 0.75
  end

  # Método chamado para renderizar a sombra do objeto de Falcon na tela
  def render_shadow
    @shadow.imagem.draw(@box.x, @box.y, 0)
  end
end
