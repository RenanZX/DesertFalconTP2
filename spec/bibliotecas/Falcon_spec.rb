require_relative '../spec_helper'

describe 'Falcon' do
  describe '.new' do
    it "Retorna uma inst\xC3\xA2ncia de Falcon" do
      expect(Falcon.new(0, 0, 0)).to be_an_instance_of Falcon
    end
  end

  describe '.sprite' do
    it 'Retorna o sprite do Falcon' do
      expect(Falcon.new(0, 0, 0).sprite).not_to be_nil
    end

    it 'Retorna a imagem do Falcon' do
      expect(Falcon.new(0, 0, 0).sprite.imagem).not_to be_nil
    end
  end

  describe '.isEqual' do
    it "Verifica se dois falcons s\xC3\xA3o iguais" do
      falcon = Falcon.new(0, 0, 0)
      expect(falcon.isEqual(falcon)).to be_truthy
    end

    it "Verifica se dois falcons s\xC3\xA3o diferentes" do
      falcon = Falcon.new(0, 0, 0)
      other_falcon = Falcon.new(10, 10, 0)
      expect(falcon.isEqual(other_falcon)).to be_falsey
    end
  end

  describe '.notity_colision' do
    it "Verifica se hove colis\xC3\xA3o com outro GameObject" do
      falcon = Falcon.new(0, 0, 0)
      game_object = GameObject.new(1, 1, 0)

      expect(falcon.notity_colision(game_object)).to be_truthy
    end

    it "Verifica se n\xC3\xA3o hove colis\xC3\xA3o com outro GameObject da mesma altura" do
      falcon = Falcon.new(0, 0, 0)
      game_object = GameObject.new(100, 100, 0)

      expect(falcon.notity_colision(game_object)).to be_falsey
    end

    it "Verifica se n\xC3\xA3o hove colis\xC3\xA3o com outro GameObject em altura diferente" do
      falcon = Falcon.new(0, 0, 0)
      game_object = GameObject.new(1, 1, 2)

      expect(falcon.notity_colision(game_object)).to be_falsey
    end
  end
end
