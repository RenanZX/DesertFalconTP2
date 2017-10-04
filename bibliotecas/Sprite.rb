require 'gosu'
require_relative "GameObject"

class Sprite
	def initialize(nomedoArquivo)
		@objeto = GameObject.new
		@imagem = Gosu::Image.new("#{File.expand_path(File.dirname(__FILE__))}/media/#{nomedoArquivo}")
	end
	
	def close
	end

	def render
		if !@objeto.nil? && !@imagem.nil?
			if !@objeto.x.nil? && !@objeto.y.nil? && !@objeto.z.nil?
				@imagem.draw(@objeto.x,@objeto.y,@objeto.z)
			else
				@imagem.draw(0,0,0)
			end
		end
	end

	def draw_shadow(x, y, height)
		@shadow = Gosu::Image.new("#{File.expand_path(File.dirname(__FILE__))}/media/shadow.png")
		if height == 2
			dist = 15
		elsif height == 1
			dist = 10
		elsif height == 0
			dist = 2		
		end			
		@shadow.draw_rot(x + dist.to_i+15, y + dist.to_i+15, 0, 0)
	end

	def setGameObject(gameobjeto)
		@objeto = gameobjeto
	end
end