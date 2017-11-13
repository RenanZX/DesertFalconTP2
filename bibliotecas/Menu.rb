require 'gosu'
require "enumerator"

class Menu
	X_DISTANCE_ITEM = 3 # distancia de cada item destacado(selecionado) do menu
	Y_DISTANCE_ITEM = 3
	def initialize
		@item_menu = Array.new #array de itens
		@logo = Gosu::Image.new("#{File.expand_path(File.dirname(__FILE__))}/media/logo.png") #logotipo
		@selection_button = Gosu::KB_BACKSPACE # butao de selecao
		@button_text = GUIText.new("Aperte Backspace para selecionar",180,350) #texto que indicara para o usuario o botao para selecionar
	end

	def setSelectionButton( selection = Gosu::KB_BACKSPACE ) #funcao que seta um botao diferente do backspace
		@selection_button = selection
	end

	def add_item( gui_text, selected = false ) # itens do menu
		texto = GUIText.new(gui_text.valor, gui_text.posx, gui_text.posy)
		gui_text.color = Gosu::Color::GRAY
		if selected == true then
			gui_text.posx += X_DISTANCE_ITEM
			gui_text.posy += Y_DISTANCE_ITEM
		end
		@item_menu << gui_text
		@item_menu << texto
	end

	def update #update do menu
		i = 0
		selected = nil
		@item_menu.each_slice(2) do | item_selecionado, item | #muda as posiçoes de acordo com o item selecionado
		 if item_selecionado.posx > item.posx and item_selecionado.posy > item.posy then
		 	selected = item_selecionado
		 end
		end

		if Gosu::button_down? Gosu::KB_BACKSPACE and !selected.nil? then
			return selected.valor
		end

		if Gosu::button_down? Gosu::KB_DOWN and !selected.nil? then
			i = @item_menu.index(selected)
			@item_menu[i].posx -= X_DISTANCE_ITEM
			@item_menu[i].posy -= Y_DISTANCE_ITEM
			sleep 0.15
			i+= 2
			if i == @item_menu.length then
				i = 0
			end
			@item_menu[i].posx+=X_DISTANCE_ITEM
			@item_menu[i].posy+=Y_DISTANCE_ITEM
		end

		if Gosu::button_down? Gosu::KB_UP and !selected.nil? then
			i = @item_menu.index(selected)
			@item_menu[i].posx -= X_DISTANCE_ITEM
			@item_menu[i].posy -= Y_DISTANCE_ITEM
			sleep 0.15
			i-= 2
			if i < 0 then
				i = @item_menu.length - 2
			end
			@item_menu[i].posx+=X_DISTANCE_ITEM
			@item_menu[i].posy+=Y_DISTANCE_ITEM
		end
		#sleep 0.0015
		if @button_text.color == Gosu::Color::WHITE then
			@button_text.color = Gosu::Color::BLACK
		elsif @button_text.color == Gosu::Color::BLACK then
			@button_text.color = Gosu::Color::WHITE
		end
	end

	def draw #desenha o menu na tela
		if !@logo.nil? then
			@logo.draw(50,80,0)
		end

		@button_text.draw

		@item_menu.each do |item|
			item.draw
		end
	end
end