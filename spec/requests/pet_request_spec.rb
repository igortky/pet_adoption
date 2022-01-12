require 'rails_helper'

  describe PetController do
    describe '#create' do
      before do
        @animal = Animal.create(name: 'Galo')
      end
      it 'create a new pet' do
        post '/pet', params: { name: 'agnes', animal_id: @animal.id,
                               checkin: Date.today,
                               checkout: Date.tomorrow,
                               birthdate: Date.today - 3.years}
        expect(response.body).to match_json_schema('pet')
        expect(response.status).to eq 201
      end
    end

    describe '#destroy' do
      before do
        @animal = Animal.create(name: 'Galo')
        @pet = Pet.create( name: 'agnes', animal_id: @animal.id,
                           checkin: Date.today,
                           checkout: Date.tomorrow,
                           birthdate: Date.today - 3.years)
      end

      it 'destroy a pet' do
        delete "/pet/#{@pet.id}"
        expect(Pet.count).to be 0
        expect(response.status).to eq 200
      end
    end

    describe '#index' do
      before do
        @animal = Animal.create(name: 'Galo')
        @pet = Pet.create( name: 'agnes', animal_id: @animal.id,
                           checkin: Date.today,
                           checkout: Date.tomorrow,
                           birthdate: Date.today - 3.years)
      end

      it 'list pets' do
        get '/pet'
        expect(response.status).to eq 200
      end
    end
    describe '#show' do
      before do
        @animal = Animal.create(name: 'Galo')
        @pet = Pet.create( name: 'agnes', animal_id: @animal.id,
                           checkin: Date.today,
                           checkout: Date.tomorrow,
                           birthdate: Date.today - 3.years)
      end

      it 'show pet' do
        get "/pet/#{@pet.id}"
        expect(response.status).to eq 200
      end
    end

    describe '#update' do
      before do
        @animal = Animal.create(name: 'Galo')
        @pet = Pet.create( name: 'agnes', animal_id: @animal.id,
                           checkin: Date.today,
                           checkout: Date.tomorrow,
                           birthdate: Date.today - 3.years)
      end

      it "changes de pet's name" do
        put "/pet/#{@pet.id}", params: { name: 'tobby' }
        expect(@pet.reload.name).to be == 'tobby'
        expect(response.status).to eq 200
      end
    end
  end
