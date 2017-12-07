require 'gosu'
require_relative 'Leitura_Pontos'
require_relative 'Escrita_Pontos'

# Classe que representa a Pontuação do usuário
class Pontuacao

  #Método de acesso para (:pontos, :input, :output_txt)
  attr_accessor :pontos, :input, :output_txt

  # Método construtor da classe Pontuação
  def initialize
    @pontos = 0
    @output = []
    @output << GUIText.new('Digite o seu nome: ', 170, 150)
    @input = Gosu::TextInput.new
    @input.text = 'Insira um Nome '
    @output << GUIText.new("Aperte 'Enter' para confirmar", 10, 10)
    @placar = GUIText.new("Get #{@pontos} Hieros", 280, 420, Gosu::Color.rgba(255, 203, 131, 255))
  end

  # Método que desenha a pontuação na tela
  def draw
    @output.each(&:draw) unless @output.nil?
  end

  # Método que desenha os pontos conquistados na tela
  def draw_points_acquired
    @placar.draw
  end

  # Método que atualiza os pontos do usuário
  def update
    if @input.nil?
      @input = Gosu::TextInput.new
      @input.text = 'Insira um Nome '
    else
      @output_txt = @input.text.clone
    end

    sleep 0.15

    return false unless Gosu.button_down? Gosu::KB_RETURN
    Escrever.new(@output_txt, @pontos) unless @output_txt.nil?
    @input.text = 'Insira um Nome ' unless @input.nil?
    @pontos = 0
  end

  # Método que atualiza os pontos obtidos 
  def update_points_acquired
    @placar.valor = "Get #{@pontos} Hieros"
  end
end

# Classe que exibe o ranking
class Placar
  #Método construtor da classe Placar
  def initialize
    @leitura = Ler.new
  end

  # Método que desenha a pontuação do usuario na tela
  def draw
     @leitura.draw unless @leitura.nil?
  end

  # Método que atualiza o ranking na tela
  def update
    @leitura.update unless @leitura.nil?
  end
end
