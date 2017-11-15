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
		if !@arquivo.nil? then
			@arquivo.close unless @arquivo.closed?
		end
		@lista_top_points.clear
	end

	def initialize_variables
		if File.exists? @caminho then
			@arquivo = File.open(@caminho,'r')
		end
		@lista_top_points = Array.new
		@lista_top_points << GUIText.new("RANKING",30,0,Gosu::Color::WHITE,30)
		@lista_top_points << GUIText.new("Pressione 'ESC' para sair",320,0,Gosu::Color::WHITE,20)
	end

	def process_points
		string_Array = Array.new
		pos_x = 5
		pos_y = 30
		maior_pontuacao = 0
		if !@arquivo.nil? then
			@arquivo.readlines.each do |line|
				line = line.chomp
				string_Array << line
			end
			@arquivo.close unless @arquivo.closed?
		end

		string_Array = string_Array.sort_by{|item| item.scan(/\d+/).map{|i| i.to_i}}
		string_Array = string_Array.reverse

		position = 0

		string_Array.each do |valor|
			string = valor.gsub('|',' ')
			txt = GUIText.new("#{position+1}.#{string}",pos_x,pos_y,Gosu::Color::WHITE,5)
			pos_y+=20
			@lista_top_points << txt
			achou = true
			position+=1
		end

	end

end