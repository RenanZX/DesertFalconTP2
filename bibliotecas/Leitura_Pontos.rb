require 'gosu'

#Classe que lê os pontos do ranking
class Ler

  # Método construtor da classe Ler
  # @param nomearquivo [String] nome do arquivo que será lido pela classe. ('ranking')
  def initialize(nomearquivo = 'ranking')
    @caminho = "#{__dir__}/" + nomearquivo
    initialize_variables
    process_points
  end

  # Método que desenha o ranking na tela
  def draw
    @lista_top_points.each(&:draw)
  end

  # Método que atualiza o ranking
  def update
    clean_variables
    initialize_variables
    process_points
  end

  # Método que limpa as variávei de classe
  def clean_variables
    unless @arquivo.nil?
      @arquivo.close unless @arquivo.closed?
    end
    @lista_top_points.clear
  end

  # Método que inicializa as variáveis
  def initialize_variables
    @arquivo = File.open(@caminho, 'r') if File.exist? @caminho
    @lista_top_points = []
    @lista_top_points << GUIText.new('RANKING', 30, 0, Gosu::Color::WHITE, 30)
    @lista_top_points << GUIText.new("Pressione 'ESC' para sair", 320, 0, Gosu::Color::WHITE, 20)
  end

  # Método que processa os pontos
  def process_points
    string_Array = []
    pos_x = 5
    pos_y = 30
    unless @arquivo.nil?
      @arquivo.readlines.each do |line|
        line = line.chomp
        string_Array << line
      end
      @arquivo.close unless @arquivo.closed?
    end

    string_Array = string_Array.sort_by { |item| item.scan(/\d+/).map(&:to_i) }
    string_Array = string_Array.reverse

    position = 0
    h = { '|' => '        ', '||' => '' }

    string_Array.each do |valor|
      string = valor.gsub(/[|||]/) do |word|
        h[word.to_s]
      end
      txt = GUIText.new("#{position + 1}.#{string}", pos_x, pos_y, Gosu::Color::WHITE, 5)
      pos_y += 20
      @lista_top_points << txt
      position += 1
    end
  end
end
