require 'gosu'
require 'enumerator'

class Menu
  # Variáveis que contêm distância de cada item destacado(selecionado) do menu
  X_DISTANCE_ITEM = 3 
  Y_DISTANCE_ITEM = 3

  # Método Construtor da classe Menu
  def initialize
    # Array de itens
    @item_menu = [] 
    # Logotipo
    @logo = Gosu::Image.new("#{__dir__}/media/logo.png")
    # Botão de seleção
    @selection_button = Gosu::KB_BACKSPACE 
    # Texto que indicará para o usuário o botão para selecionar
    @button_text = GUIText.new('Aperte Backspace para selecionar', 180, 350) 
  end

  # Função que seta um botão diferente do backspace
  # @param selection - botão selecionado
  def setSelectionButton(selection = Gosu::KB_BACKSPACE) 
    @selection_button = selection
  end

  # Método que adiciona itens ao menu
  # @param gui_text [GUIText] texto que será mostrado
  # @param selected [boolean] indica se o usuário selecionou algo ou não
  def add_item(gui_text, selected = false)
    texto = gui_text.clone
    gui_text.color = Gosu::Color::GRAY
    if selected == true
      gui_text.posx += X_DISTANCE_ITEM
      gui_text.posy += Y_DISTANCE_ITEM
    end
    @item_menu << gui_text
    @item_menu << texto
  end

  # Atualiza o menu
  def update 
    selected = nil
    # Muda as posições de acordo com o item selecionado
    @item_menu.each_slice(2) do |item_selecionado, item| 
      if (item_selecionado.posx > item.posx) && (item_selecionado.posy > item.posy)
        selected = item_selecionado
      end
    end

    if Gosu.button_down?(Gosu::KB_BACKSPACE) && !selected.nil?
      return selected.valor
    end

    if Gosu.button_down?(Gosu::KB_DOWN) && !selected.nil?
      i = @item_menu.index(selected)
      @item_menu[i].posx -= X_DISTANCE_ITEM
      @item_menu[i].posy -= Y_DISTANCE_ITEM
      sleep 0.15
      i += 2
      i = 0 if i == @item_menu.length
      @item_menu[i].posx += X_DISTANCE_ITEM
      @item_menu[i].posy += Y_DISTANCE_ITEM
    end

    if Gosu.button_down?(Gosu::KB_UP) && !selected.nil?
      i = @item_menu.index(selected)
      @item_menu[i].posx -= X_DISTANCE_ITEM
      @item_menu[i].posy -= Y_DISTANCE_ITEM
      sleep 0.15
      i -= 2
      i = @item_menu.length - 2 if i < 0
      @item_menu[i].posx += X_DISTANCE_ITEM
      @item_menu[i].posy += Y_DISTANCE_ITEM
    end
    # sleep 0.25
    if @button_text.color == Gosu::Color::WHITE
      @button_text.color = Gosu::Color::BLACK
    elsif @button_text.color == Gosu::Color::BLACK
      @button_text.color = Gosu::Color::WHITE
    end
  end

  # desenha o menu na tela
  def draw 
    @logo.draw(50, 80, 0) unless @logo.nil?

    @button_text.draw

    @item_menu.each(&:draw)
  end
end
