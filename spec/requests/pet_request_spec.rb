require 'rails_helper'

  describe PetController do
    describe '#create' do
      it 'create a new pet' do
        post '/pet', params: { name: 'agnes', checkin: Date.today,
                               checkout: Date.tomorrow,
                               birthdate: Date.today - 3.years}

        expect(Pet.count).to be 1
      end
    end

    describe '#destroy' do
      before do
        @pet = Pet.create( name: 'agnes', checkin: Date.today,
                           checkout: Date.tomorrow,
                           birthdate: Date.today - 3.years)
      end

      it 'destroy a pet' do
        delete "/pet/#{@pet.id}"
        expect(Pet.count).to be 0
      end
    end
  end
