require_relative '../spec_helper'

describe 'Escrever' do
 describe '.new' do
  it "Retorna uma inst\xC3\xA2ncia de Escrever" do
   expect(Escrever.new('nome_jogador_teste', 10,ARQUIVO_TESTE)).to be_an_instance_of Escrever
  end

  it "Escreve em um arquivo ja criado" do
   expect(Escrever.new('nome_jogador_teste',10,ARQUIVO_TESTE)).to be_an_instance_of Escrever
  end
 end
end