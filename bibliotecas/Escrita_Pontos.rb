require 'gosu'

# Classe que escreve a pontuação na tela
class Escrever
  # Método construto da classe Escrever
  # @param nome [Numeric] - Nome do jogador
  # @param pontos [Numeric] - pontos conquistados
  # @param arquivo [String] - 'ranking'
  def initialize(nome, pontos, arquivo = 'ranking')
    caminho = "#{__dir__}/" + arquivo
    if !File.exist? caminho
      @arquivo = File.new(caminho, 'w')
      @arquivo.puts "#{nome}|#{pontos}||\n"
    else
      @arquivo = File.new(caminho, 'a')
      @arquivo << "#{nome}|#{pontos}||\n"
    end
    @arquivo.close unless @arquivo.closed?
  end
end
