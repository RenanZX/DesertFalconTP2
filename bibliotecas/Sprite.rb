require 'gosu'

class Sprite
	attr_accessor :imagem

	def initialize(nomedoArquivo)
		@imagem = Gosu::Image.new("#{File.expand_path(File.dirname(__FILE__))}/media/#{nomedoArquivo}")
	end

	def close
	end

	def render (posX = 0, posY = 0, z = 0)
		if (!@imagem.nil?)
			@imagem.draw(posX, posY, z)
		end
	end

end