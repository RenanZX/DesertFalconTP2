require 'gosu'
require_relative "bibliotecas/Janela"
require_relative "bibliotecas/Hiero"
require_relative "bibliotecas/Falcon"
require_relative "bibliotecas/GUIText"

window = Window.new(640,480) #define o tamanho da tela
window.set_background("cenario.png")

for i in 0..100 #insere os hieros
	$x = Random.new.rand(0..640)
	$k = Random.new.rand(0..480)
	hiero = Hiero.new($k,$x,0)
	window.add_hiero(hiero)
end

gui_text = GUIText.new("Aperte 'ESC' para sair", 10, 10, Gosu::Color::GREEN)
window.add_gui_text(gui_text)
window.show