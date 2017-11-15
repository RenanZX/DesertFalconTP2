require 'gosu'
require_relative "GameObject"
require_relative "Sprite"
require_relative "Box"

class Enemy < GameObject
	def initialize(x,y,z)
		@sprite = Sprite.new "enemy.png"
		@shadow = Sprite.new "shadow_enemy.png"
		super
	end
	def move
		@velx = Gosu.offset_x(225, 3)
		@vely = Gosu.offset_y(225, 3)
		@box.x += @velx
		@box.y += @vely
	end	
	def update
		move
	end

	def render
		if @z != 0
			render_shadow
		end
		super
	end

	private
		def render_shadow
			@shadow.imagem.draw(@box.x, @box.y, 0)
		end
end