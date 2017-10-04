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
		if height == 10
			dist = 30
		elsif height == 9
			dist = 28
		elsif height == 8
			dist = 27
		elsif height == 7
			dist = 26
		elsif height == 6
			dist = 25
		elsif height == 5
			dist = 24
		elsif height == 4
			dist = 23
		elsif height == 3
			dist = 22
		elsif height == 2
			dist = 21
		elsif height == 1
			dist = 19
		elsif height == 0
			dist = 18		
		end	
		@shadow.draw_rot(x + dist.to_i, y + dist.to_i, 0, 0)
	end

	def setGameObject(gameobjeto)
		@objeto = gameobjeto
	end
end