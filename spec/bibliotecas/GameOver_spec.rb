require_relative '../spec_helper'

describe 'GameOver' do
 describe '.new' do
  it "Retorna uma inst\xC3\xA2ncia do GameOver" do
   expect(GameOver.new).to be_an_instance_of GameOver
  end
 end
end