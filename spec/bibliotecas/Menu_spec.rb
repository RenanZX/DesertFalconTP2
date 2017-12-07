require_relative '../spec_helper'

describe 'Menu' do
 describe '.new' do
  it "Retorna uma inst\xC3\xA2ncia do Menu" do
   expect(Menu.new).to be_an_instance_of Menu
  end
 end
end