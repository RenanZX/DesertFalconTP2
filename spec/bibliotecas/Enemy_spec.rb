require_relative '../spec_helper'

describe 'Enemy' do 
 describe '.new' do
    it "Retorna uma inst\xC3\xA2ncia de Enemy" do
      expect(Enemy.new(0, 0, 0)).to be_an_instance_of Enemy
    end
  end

  describe '.sprite' do
    it 'Retorna o sprite do Obstaculo' do
      expect(Enemy.new(0, 0, 0).sprite).not_to be_nil
    end

    it 'Retorna a imagem do Enemy' do
      expect(Enemy.new(0, 0, 0).sprite.imagem).not_to be_nil
    end
  end

  describe '.isEqual' do
    it "Verifica se dois Enemys s\xC3\xA3o iguais" do
      enemy = Enemy.new(0, 0, 0)
      expect(enemy.isEqual(enemy)).to be_truthy
    end

    it "Verifica se dois Enemys s\xC3\xA3o diferentes" do
      enemy = Enemy.new(0, 0, 0)
      other_Enemy = Enemy.new(10, 10, 0)
      expect(enemy.isEqual(other_Enemy)).to be_falsey
    end
  end

  describe '.notity_colision' do
    it "Verifica se hove colis\xC3\xA3o com outro GameObject" do
      enemy = Enemy.new(0, 0, 0)
      game_object = GameObject.new(1, 1, 0)

      expect(enemy.notity_colision(game_object)).to be_truthy
    end

    it "Verifica se n\xC3\xA3o hove colis\xC3\xA3o com outro GameObject da mesma altura" do
      enemy = Enemy.new(0, 0, 0)
      game_object = GameObject.new(100, 100, 0)

      expect(enemy.notity_colision(game_object)).to be_falsey
    end

    it "Verifica se n\xC3\xA3o hove colis\xC3\xA3o com outro GameObject em altura diferente" do
      enemy = Enemy.new(0, 0, 0)
      game_object = GameObject.new(1, 1, 2)

      expect(enemy.notity_colision(game_object)).to be_falsey
    end
  end
  
  describe '.move' do
   it "Verifica a movimentacao do Enemy" do
    enemy = Enemy.new(0, 0, 0)
    enemy.move
   end
  end

  describe '.update' do
    it "Verifica se o movimento do Enemy e atualizado" do
     enemy = Enemy.new(0, 0, 0)
     enemy.update
    end
  end
end