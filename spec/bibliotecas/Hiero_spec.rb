require_relative '../spec_helper'

describe 'Hiero' do
  describe '.new' do
    it "Retorna uma inst\xC3\xA2ncia de Hiero" do
      expect(Hiero.new(0, 0, 0)).to be_an_instance_of Hiero
    end
  end

  describe '.sprite' do
    it 'Retorna o sprite do Hiero' do
      expect(Hiero.new(0, 0, 0).sprite).not_to be_nil
    end

    it 'Retorna a imagem do Hiero' do
      expect(Hiero.new(0, 0, 0).sprite.imagem).not_to be_nil
    end
  end

  describe '.isEqual' do
    it "Verifica se dois hieros s\xC3\xA3o iguais" do
      hiero = Hiero.new(0, 0, 0)
      expect(hiero.isEqual(hiero)).to be_truthy
    end

    it "Verifica se dois hieros s\xC3\xA3o diferentes" do
      hiero = Hiero.new(0, 0, 0)
      other_hiero = Hiero.new(10, 10, 0)
      expect(hiero.isEqual(other_hiero)).to be_falsey
    end
  end

  describe '.notity_colision' do
    it "Verifica se hove colis\xC3\xA3o com outro GameObject" do
      hiero = Hiero.new(0, 0, 0)
      game_object = GameObject.new(1, 1, 0)

      expect(hiero.notity_colision(game_object)).to be_truthy
    end

    it "Verifica se n\xC3\xA3o hove colis\xC3\xA3o com outro GameObject da mesma altura" do
      hiero = Hiero.new(0, 0, 0)
      game_object = GameObject.new(100, 100, 0)

      expect(hiero.notity_colision(game_object)).to be_falsey
    end

    it "Verifica se n\xC3\xA3o hove colis\xC3\xA3o com outro GameObject em altura diferente" do
      hiero = Hiero.new(0, 0, 0)
      game_object = GameObject.new(1, 1, 2)

      expect(hiero.notity_colision(game_object)).to be_falsey
    end
  end

  describe '.move' do
   it "Verifica a movimentacao do hiero" do
    hiero = Hiero.new(0, 0, 0)
    hiero.move
   end
  end

  describe '.update' do
    it "Verifica se o movimento do hiero e atualizado" do
     hiero = Hiero.new(0, 0, 0)
     hiero.update
    end
  end
end
