require 'gosu'
require "enumerator"

class Menu
	X_DISTANCE_ITEM = 3
	Y_DISTANCE_ITEM = 3
	def initialize
		@item_menu = Array.new
		@logo = Gosu::Image.new("#{File.expand_path(File.dirname(__FILE__))}/media/logo.png")
		@selection_button = Gosu::KB_BACKSPACE
		@button_text = GUIText.new("Aperte Backspace para selecionar",180,350)
	end

	def setSelectionButton( selection = Gosu::KB_BACKSPACE )
		@selection_button = selection
	end

	def add_item( gui_text, selected = false )
		texto = GUIText.new(gui_text.valor, gui_text.posx, gui_text.posy)
		gui_text.color = Gosu::Color::GRAY
		if selected == true then
			gui_text.posx += X_DISTANCE_ITEM
			gui_text.posy += Y_DISTANCE_ITEM
		end
		@item_menu << gui_text
		@item_menu << texto
	end

	def update
		i = 0
		selected = nil
		@item_menu.each_slice(2) do | item_selecionado, item |
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
		if @button_text.color == Gosu::Color::WHITE then
			@button_text.color = Gosu::Color::BLACK
		elsif @button_text.color == Gosu::Color::BLACK then
			@button_text.color = Gosu::Color::WHITE
		end
	end

	def draw
		if !@logo.nil? then
			@logo.draw(50,80,0)
		end

		@button_text.font.draw(@button_text.valor, @button_text.posx, @button_text.posy, @button_text.posz, 1, 1, @button_text.color)

		@item_menu.each do |item|
			item.font.draw(item.valor, item.posx, item.posy, item.posz, 1, 1, item.color)
		end
	end
end