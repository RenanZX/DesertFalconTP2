require 'gosu'

class Escrever
	def initialize(nome,pontos,arquivo="ranking")
		caminho = "#{File.expand_path(File.dirname(__FILE__))}/"+arquivo
		if !File.exists? caminho then
			@arquivo = File.new(caminho,'w')
			@arquivo.puts "#{nome}|#{pontos}||\n"
		else
			@arquivo = File.new(caminho,'a')
			@arquivo << "#{nome}|#{pontos}||\n"
		end
		@arquivo.close unless @arquivo.closed?
	end
end