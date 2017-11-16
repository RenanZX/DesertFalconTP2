require_relative '../spec_helper'

describe 'Box' do
  describe '.new' do
    it "Retorna uma inst\xC3\xA2ncia de Box" do
      expect(Box.new(0, 0, 0, 0)).to be_an_instance_of Box
    end

    it 'Cria uma Box com os argumentos recebidos' do
      x = 10
      y = 10
      w = 20
      h = 20

      box = Box.new(x, y, h, w)

      expect(box.x).to eq x
      expect(box.y).to eq y
      expect(box.w).to eq w
      expect(box.h).to eq h
    end
  end

  describe '.overlaps_with' do
    it "Verifica se ouve colis\xC3\xA3o com outro GameObject" do
      box = Box.new(0, 0, 10, 10)
      game_object = GameObject.new(5, 5, 0)

      expect(box.overlaps_with(game_object)).to be_truthy
    end

    it "Verifica se n\xC3\xA3o houve colis\xC3\xA3o com GameObject" do
      box = Box.new(0, 0, 10, 10)
      game_object = GameObject.new(100, 100, 0)

      expect(box.overlaps_with(game_object)).to be_falsey
    end
  end
end
