require 'gosu'
require_relative 'GameObject'
require_relative 'Sprite'
require_relative 'Box'

class Hiero < GameObject
  def initialize(x, y, z)
    @sprite = Sprite.new 'hiero.png'
    super
  end

  def close; end

  def move
    @velx = Gosu.offset_x(225, 1)
    @vely = Gosu.offset_y(225, 1)
    @box.x += @velx
    @box.y += @vely
  end

  def update
    move
  end
end
