require 'gosu'

class Ler
	def initialize(nomearquivo = "ranking")
		@caminho = "#{File.expand_path(File.dirname(__FILE__))}/"+nomearquivo
		initialize_variables
		process_points
	end

	def draw
		@lista_top_points.each do |item|
			item.draw
		end
	end

	def update
		clean_variables
		initialize_variables
		process_points
	end

	def clean_variables
		@arquivo.close unless @arquivo.closed?
		@lista_points.clear
		@lista_top_points.clear
	end

	def initialize_variables
		if File.exists? @caminho then
			@arquivo = File.open(@caminho,'r')
		end
		@lista_points = Array.new
		@lista_top_points = Array.new
	end
	def process_points
		string_Array = Array.new
		pos_x = 5
		pos_y = 5
		maior_pontuacao = 0
		if !@arquivo.nil? then
			@arquivo.readlines.each do |line|
				line = line.chomp
				n = line.index("|").to_i
				n+=1 
				m = line.index("||").to_i
				m+=1
				pontos = line[n..m].to_i
				@lista_points << pontos
				string_Array << line
			end
			@arquivo.close unless @arquivo.closed?
		end

		@lista_points.sort.reverse

		@lista_points.each do |valor|
			i = 0
			achou = false
			while (i != string_Array.length) and (!achou) do
				n = string_Array[i].index("|").to_i
				n+=1
				m = string_Array[i].index("||").to_i
				m+=1
				pontos = string_Array[i][n..m].to_i
				if pontos == valor
					string = string_Array[i].gsub('|',' ')
					txt = GUIText.new(string,pos_x,pos_y,Gosu::Color::WHITE,5)
					pos_y+=20
					@lista_top_points << txt
					achou = true
				end
				i+=1
			end
		end

	end

end