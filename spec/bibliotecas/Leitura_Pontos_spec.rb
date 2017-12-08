require_relative '../spec_helper'

describe 'Ler' do
 describe '.new' do
  it "Retorna uma inst\xC3\xA2ncia de Ler" do
   expect(Ler.new(ARQUIVO_TESTE)).to be_an_instance_of Ler
  end
 end

 describe '.update' do
  it "Atualiza o ranking do Leitor de Pontos" do
   ler = Ler.new(ARQUIVO_TESTE)
   ler.update
  end
 end
end