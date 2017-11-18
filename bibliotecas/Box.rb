require 'gosu'
require_relative 'Sprite'
require_relative 'GameObject'

# Classe que delimita a area que um GameObject pode ocupar na tela
class Box
  attr_accessor :x, :y, :h, :w

  # Método contrustor da Box
  # @param x [Numeric] - coordenada x da entidade
  # @param y [Numeric] - coordenada y da entidade
  # @param h [Numeric] - altura da entidade
  # @param w [Numeric] - largura da entidade
  def initialize(x, y, h, w)
    @x = x
    @y = y
    @h = h
    @w = w
  end

  #Método destrutor da classe Box
  def close; end

  # Método que verifica se um objeto de GameObject sobrepôs outro objeto GameObject
  # @param gameobj [GameObject] - Objeto a ser comparado
  # @return [bool] - true em caso de sobreposição, false cas contrário
  def overlaps_with(gameobj)
    if !gameobj.nil? && !gameobj.box.nil?
      other_box = gameobj.box
      if @x < other_box.x + other_box.w &&
         @x + @w > other_box.x &&
         @y < other_box.y + other_box.h &&
         @h + @y > other_box.y
        return true
      end
    end
    false
  end
end
