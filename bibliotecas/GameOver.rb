require 'gosu'

# Classe que representa o caso em que o usuário perdeu
class GameOver

  # Método construtor da classe GameOver
  def initialize
    @game_over = GUIText.new('GAME OVER', 170, 150, Gosu::Color::RED, 20, 3.0)
    @continue = GUIText.new('Pressione Enter para conitinuar', 280, 420)
  end

  # Método que atualiza a tela e verifica a ação tomada pelo usuário
  def update
    if @continue.color == Gosu::Color::WHITE
      @continue.color = Gosu::Color::BLACK
    elsif @continue.color == Gosu::Color::BLACK
      @continue.color = Gosu::Color::WHITE
    end
    if Gosu.button_down?(Gosu::KB_ENTER) || Gosu.button_down?(Gosu::KB_RETURN)
      sleep 0.15
      return true
    end
  end

  # Desenha as mensagens de game over na tela
  def draw
    @game_over.draw
    @continue.draw
  end
end
