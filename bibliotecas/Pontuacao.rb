require 'gosu'
require_relative 'Leitura_Pontos'
require_relative 'Escrita_Pontos'

class Pontuacao
	attr_accessor :pontos,:input,:output_txt
	
	def initialize
		@pontos = 0
		@output = Array.new
		@output << GUIText.new("Digite o seu nome: ",170,150)
		@input =  Gosu::TextInput.new
		@input.text = "Insira um Nome "
		@output << GUIText.new("Aperte 'Enter' para confirmar",10,10)
	end

	def draw
		if !@output.nil? then
			@output.each do |item|
				item.draw
			end
		end
	end

	def update
		if @input.nil? then
			@input =  Gosu::TextInput.new
			@input.text = "Insira um Nome "
		else
			@output_txt = @input.text.clone
		end

		sleep 0.15

		if Gosu::button_down? Gosu::KB_RETURN then
			if !@output_txt.nil?
				Escrever.new(@output_txt,@pontos)
			end
			return true
		end
	end
end

class Placar
	def initialize
		@leitura = Ler.new
	end

	def draw
		@leitura.draw
	end

	def update
		@leitura.update
	end
end