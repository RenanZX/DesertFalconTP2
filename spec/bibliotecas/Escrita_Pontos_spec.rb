require_relative '../spec_helper'

describe 'Escrever' do
 describe '.new' do
  it "Retorna uma inst\xC3\xA2ncia de Escrever" do
   expect(Escrever.new('nome_jogador_teste', 10)).to be_an_instance_of Escrever
  end

  it "Retorna uma inst\xC3\xA2ncia de Escrever com um nome de arquivo diferente" do
   arquivo = '../bibliotecas/rank_teste'
   expect(Escrever.new('nome_jogador_teste',10,arquivo)).to be_an_instance_of Escrever
   File.delete(arquivo) if File.exists? arquivo
  end
 end
end