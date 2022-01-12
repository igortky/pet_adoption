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

        expect(Pet.count).to be 1
        puts response.body
        expect(response.body).to match_json_schema('pet')
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
  end
