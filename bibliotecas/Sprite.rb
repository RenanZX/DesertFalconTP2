require 'gosu'

class Sprite
	def initialize(nomedoArquivo)
		@x, @y, @z = 0, 0, 0
		@imagem = Gosu::Image.new("#{File.expand_path(File.dirname(__FILE__))}/media/#{nomedoArquivo}")
	end

	def setPosition(x,y,z)
		@x = x
		@y = y
		@z = z
	end
	
	def close
	end

	def render
		if !@imagem.nil?
			if !@x.nil? && !@y.nil? && !@z.nil?
				@imagem.draw(@x,@y,@z)
			else
				@imagem.draw(0,0,0)
			end
		end
	end
end