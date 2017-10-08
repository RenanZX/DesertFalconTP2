require_relative '../spec_helper'

describe "Janela" do
    describe ".new" do
        it "Retorna uma instância de Janela" do
            expect(Window.new(640, 480)).to be_an_instance_of Window
        end

        it "Verifica o tamanho da janela com os argumentos recbidos" do
            width = 640
            height = 480
            janela = Window.new(width, height)
            
            expect(janela.width).to eq width
            expect(janela.height).to eq height
        end
    end
end