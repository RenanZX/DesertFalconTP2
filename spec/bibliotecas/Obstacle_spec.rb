require_relative '../spec_helper'

describe 'Obstacle' do 
 describe '.new' do
    it "Retorna uma inst\xC3\xA2ncia de Obstacle" do
      expect(Obstacle.new(0, 0, 0)).to be_an_instance_of Obstacle
    end
  end

  describe '.sprite' do
    it 'Retorna o sprite do Obstaculo' do
      expect(Obstacle.new(0, 0, 0).sprite).not_to be_nil
    end

    it 'Retorna a imagem do Obstacle' do
      expect(Obstacle.new(0, 0, 0).sprite.imagem).not_to be_nil
    end
  end

  describe '.isEqual' do
    it "Verifica se dois Obstacles s\xC3\xA3o iguais" do
      obstacle = Obstacle.new(0, 0, 0)
      expect(obstacle.isEqual(obstacle)).to be_truthy
    end

    it "Verifica se dois Obstacles s\xC3\xA3o diferentes" do
      obstacle = Obstacle.new(0, 0, 0)
      other_Obstacle = Obstacle.new(10, 10, 0)
      expect(obstacle.isEqual(other_Obstacle)).to be_falsey
    end
  end

  describe '.notity_colision' do
    it "Verifica se hove colis\xC3\xA3o com outro GameObject" do
      obstacle = Obstacle.new(0, 0, 0)
      game_object = GameObject.new(1, 1, 0)

      expect(obstacle.notity_colision(game_object)).to be_truthy
    end

    it "Verifica se n\xC3\xA3o hove colis\xC3\xA3o com outro GameObject da mesma altura" do
      obstacle = Obstacle.new(0, 0, 0)
      game_object = GameObject.new(100, 100, 0)

      expect(obstacle.notity_colision(game_object)).to be_falsey
    end

    it "Verifica se n\xC3\xA3o hove colis\xC3\xA3o com outro GameObject em altura diferente" do
      obstacle = Obstacle.new(0, 0, 0)
      game_object = GameObject.new(1, 1, 2)

      expect(obstacle.notity_colision(game_object)).to be_falsey
    end
  end

  describe '.move' do
   it "Verifica a movimentacao dos Obstacles" do
    obstacle = Obstacle.new(0, 0, 0)
    obstacle.move
   end
  end
  
  describe '.update' do
    it "Verifica se o movimento do Obstacle e atualizado" do
     obstacle = Obstacle.new(0, 0, 0)
     obstacle.update
    end
  end
end