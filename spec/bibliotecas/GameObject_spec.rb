require_relative '../spec_helper'

describe "GameObject" do 

    describe ".new" do
        before do
            @game_object = GameObject.new
        end

        it "Retorna uma instancia de GameObject" do
            expect(@game_object).to be_an_instance_of GameObject
        end

        it "Seta valores default" do
            expect(@game_object.box.x).to eq 0
            expect(@game_object.box.y).to eq 0
            expect(@game_object.z).to eq 0
        end
    end

    describe ".isEqual" do
        it "Verifica se um GameObject é igual a outro" do
            game_object = GameObject.new
            expect(game_object.isEqual game_object).to be_truthy
        end

        it "Verifica se um GameObject é diferemte do outro" do
            game_object = GameObject.new
            expect(game_object.isEqual GameObject.new).to be_falsey
        end
    end

    describe ".notity_colision" do
        it "Verifica se houve colisão entre dois GameObjects" do
            game_object = GameObject.new
            game_object.box.h = 10
            game_object.box.w = 10
            
            other_obj = GameObject.new(5, 5, 0)
            other_obj.box.h = 5
            other_obj.box.h = 5

            expect(game_object.notity_colision other_obj).to be_truthy
        end

        it "Verifica se não houve colisão entre dois GameObjects" do
            game_object = GameObject.new
            game_object.box.h = 10
            game_object.box.w = 10
            
            #Outro GameObject está sendo instanciado na altura 2
            other_obj = GameObject.new(5, 5, 2)
            other_obj.box.h = 5
            other_obj.box.h = 5

            expect(game_object.notity_colision other_obj).to be_falsey
        end
    end
end
