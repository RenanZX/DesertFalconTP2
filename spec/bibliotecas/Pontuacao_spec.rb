require_relative '../spec_helper'

describe 'Pontuacao' do
 describe '.new' do
  it "Retorna uma inst\xC3\xA2ncia de Pontuacao" do
   expect(Pontuacao.new).to be_an_instance_of Pontuacao
  end
 end

 describe '.pontos' do
  it "Verifica a quantidade de pontos adiquiridos na jogatina" do
   points = Pontuacao.new
   points.pontos +=1
   expect(points.pontos).to eq(1)
  end
 end

 describe '.output_txt' do
  it "Verifica a saida de texto apos usuario digitar o texto" do
   points = Pontuacao.new
   points.output_txt = 'nome'
   expect(points.output_txt).to eq('nome')
  end
 end

 describe '.input' do
  it "Verifica o input do usuario" do
   points = Pontuacao.new
   points.input = Gosu::TextInput.new
   points.input.text = 'texto usuario'
   expect(points.input.text).to eq('texto usuario')
  end
 end
end

describe 'Placar' do
 describe '.new' do
  it "Retorna uma inst\xC3\xA2ncia de Placar" do
   expect(Placar.new).to be_an_instance_of Placar
  end
 end
end