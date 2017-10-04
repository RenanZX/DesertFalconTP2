require 'gosu'
require_relative "bibliotecas/Janela"
require_relative "bibliotecas/Hiero"
require_relative "bibliotecas/Falcon"


window = Window.new(640,480)
window.setBackground("cenario.png")
var = Falcon.new(200,200,0)
var.setAreaWindow(640,480)
var2 = Hiero.new(150,150,0)
window.setGameObject(var2)
window.setGameObject(var)
window.setText("Aperte 'ESC' para sair",10,10)
window.show