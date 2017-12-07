require 'gosu'
require_relative 'Falcon'
require_relative 'Hiero'
require_relative 'Menu'
require_relative 'Enemy'
require_relative 'Obstacle'
require_relative 'GameOver'
require_relative 'Pontuacao'

 # Classe que representa a janela do jogo
class Window < Gosu::Window
  #Variáveis constantes de opção para voltar para menu
  MENU = 0
  #Variáveis constantes de opção para voltar para ir para o jogo
  JOGO = 1
  #Variáveis constantes de opção para mostrar placar
  PLACAR = 2
  #Variáveis constantes de opção para ver pontos
  PONTO = 3
  #Variáveis constantes de opção quando o jogador perder
  GAME_OVER = 4

  # Método construtor d classe Window
  # @param largura [int] largura da tela
  # @param altura [int] altura da tela
  def initialize(largura, altura) 
    super largura, altura
    self.caption = 'Desert Ruby' # titulo da janela

    @falconX = 80
    @falconY = altura - 150
    @falconZ = 0

    @list_gui_text = []
    @game_over = GameOver.new
    initialize_menu
    initialize_game
    @pontuacao = Pontuacao.new
    @placar = Placar.new
    @font_input = Gosu::Font.new(20, name: 'Nimbus Mono L')
    @estado = MENU
  end

  # Método que adiciona os textos na janela
  # @param gui_text [GUIText] texto que será adicionado
  def add_gui_text(gui_text)
    @list_gui_text << gui_text
  end

  # Método para verificar a opção escolhida pello usuário
  def update
    case @estado # prototipo ainda em desenvolvimento
    when MENU # verifica o estado da janela
      valor = @menu.update
      if valor == 'Jogar' # verifica a opcao que o usuario escolheu
        @estado = JOGO
      elsif valor == 'Placar'
        @estado = PLACAR
      elsif valor == 'Sair'
        close
      end
    when JOGO
      @player.update
      generate('hiero')
      generate('enemy')
      generate('obstacle')

      @lista_hieros.each(&:update)

      @lista_enemys.each(&:update)

      @lista_obstacles.each(&:update)

      calculate_colisions
      remove_unecessary_objs
      @pontuacao.update_points_acquired

    when PLACAR
      @placar.update
    when PONTO
      self.text_input = @pontuacao.input unless @pontuacao.nil?
      if !@pontuacao.nil? && @pontuacao.update
        @estado = MENU
        self.text_input = nil
      end
    when GAME_OVER
      if !@game_over.nil? && @game_over.update
        @estado = PONTO
        clear_game
        initialize_game
      end
    end
  end

  # Método que coloca um arquivo de imagem como fundo da tela
  # @param [String] nomearquivo de um arquivo de imagem
  def set_background(nomearquivo) 
    @imagem_fundo = Gosu::Image.new("#{__dir__}/media/#{nomearquivo}")
  end

  # Método que adiciona hieros para tela
  # @param hiero [Hiero] hiero que será adicionado
  def add_hiero(hiero)
    @lista_hieros << hiero
  end

  # Método que adiciona inimigos para tela 
  # @param enemy [Enemy] inimigo que será adicionado
  def add_enemy(enemy)
    @lista_enemys << enemy
  end

  # Método que adiciona obstáculos para tela
  # @param obstacle [Obstáculo] obstacle que será adicionado
  def add_obstacle(obstacle)
    @lista_obstacles << obstacle
  end

  # Método que desenha os objetos na tela
  def draw
    case @estado
    when MENU
      @menu.draw
    when JOGO
      @imagem_fundo.draw(0, 0, 0) unless @imagem_fundo.nil?

      @lista_hieros.each(&:render)

      @lista_enemys.each(&:render)

      @lista_obstacles.each(&:render)

      draw_text
      @pontuacao.draw_points_acquired

      @player.render
    when PLACAR
      @placar.draw
    when GAME_OVER
      @game_over.draw

    when PONTO
      @pontuacao.draw
      unless text_input.nil?
        @font_input.draw("#{text_input.text} você coletou #{@pontuacao.pontos} hieros", 180, 200, 0)
        @pontuacao.input = text_input
      end
    end
  end

  def button_down(id) # identifica os botoes que sao apertados pelo usuario
    case id
    when Gosu::KB_ESCAPE
      @estado = MENU
      self.text_input = nil
    else
      super
    end
  end

  private

  # Métodos de acesso para (:estado, :save_position_menu)
  attr_accessor :estado, :save_position_menu

  # Método que cria o menu
  def initialize_menu
    @menu = Menu.new
    margem_item = 220
    posicaomenu = 250

    menuopcao = GUIText.new('Jogar', posicaomenu, margem_item)
    @menu.add_item(menuopcao, true)
    margem_item += 20
    menuopcao = GUIText.new('Placar', posicaomenu, margem_item)
    @menu.add_item(menuopcao)
    margem_item += 20
    menuopcao = GUIText.new('Sair', posicaomenu, margem_item)
    @menu.add_item(menuopcao)
  end

  # Método que inicia o jogo
  def initialize_game
    @lista_hieros = []
    @lista_enemys = []
    @lista_obstacles = []
    @player = Falcon.new(@falconX, @falconY, @falconZ)
  end

  # Método que limpa a tela do jogo
  def clear_game
    @lista_hieros.clear
    @lista_enemys.clear
    @lista_obstacles.clear
    @player.close
  end

  # Método que escreve os devidos textos na tela
  def draw_text
    @list_gui_text.each(&:draw)
  end

  # Método que calcula as colisões
  def calculate_colisions
    i = 0
    while i < @lista_hieros.length
      if @player.notity_colision @lista_hieros[i]
        @lista_hieros.delete_at i
        @pontuacao.pontos += 1
      end
      i += 1
    end
    @lista_enemys.each do |enemy|
      @estado = GAME_OVER if @player.notity_colision enemy
    end
    @lista_obstacles.each do |obstacle|
      @estado = GAME_OVER if @player.notity_colision obstacle
    end
  end

  #Método que remove objetos (GameObjects) desnecessários
  def remove_unecessary_objs
    i = 0
    while i < @lista_hieros.length
      hiero = @lista_hieros[i]

      @lista_hieros.delete_at i if hiero.box.x < -20

      i += 1
    end
  end

  # Método que gera um GameObject
  # @param name [String] nome do GameObject (hiero, enemy, obstacle)
  def generate(name)
    if rand(200) < 1
      if name == 'hiero'
        hiero = Hiero.new(rand(680), 0, 0)
        add_hiero hiero
      elsif name == 'enemy'
        enemy = Enemy.new(rand(680), 0, rand(0..2))
        add_enemy enemy
      elsif name == 'obstacle'
        obstacle = Obstacle.new(rand(680), 0, 0)
        add_obstacle obstacle
      end
    end
  end
end
