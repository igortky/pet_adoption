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
  end
