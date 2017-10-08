require_relative '../spec_helper'

describe "Sprite" do
    describe ".new" do
        it "Retorna uma instancia de Sprite" do
            expect(Sprite.new "falcon.png").to be_an_instance_of Sprite
        end
    end

    describe ".imagem" do
        it "Retorna a imagem do Sprite" do
            expect(Sprite.new "falcon.png").not_to be_nil
        end
    end
end