require 'gosu'
require_relative 'Leitura_Pontos'
require_relative 'Escrita_Pontos'

class Pontuacao
  attr_accessor :pontos, :input, :output_txt

  def initialize
    @pontos = 0
    @output = []
    @output << GUIText.new('Digite o seu nome: ', 170, 150)
    @input = Gosu::TextInput.new
    @input.text = 'Insira um Nome '
    @output << GUIText.new("Aperte 'Enter' para confirmar", 10, 10)
    @placar = GUIText.new("Get #{@pontos} Hieros", 280, 420, Gosu::Color.rgba(255, 203, 131, 255))
  end

  def draw
    @output.each(&:draw) unless @output.nil?
  end

  def draw_points_acquired
    @placar.draw
  end

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

  def update_points_acquired
    @placar.valor = "Get #{@pontos} Hieros"
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
