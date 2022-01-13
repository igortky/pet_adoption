# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Pet' do
  let!(:animal) { Animal.create(name: :Dog) }
  let!(:pet) do
    Pet.create(name: 'agnes', animal_id: animal.id,
               checkin: Date.today,
               checkout: Date.tomorrow,
               birthdate: Date.today - 3.years)
  end

  get '/pet' do
    let!(:fish) { Animal.create(name: :fish) }
    let!(:guinea_pig) { Animal.create(name: :'guine pig') }
    let!(:tobby) do
      Pet.create(name: 'tobby', animal_id: guinea_pig.id,
                 checkin: Date.today,
                 checkout: Date.tomorrow,
                 birthdate: Date.today - 3.years)
    end
    let!(:fluffy) do
      Pet.create(name: 'fluffy', animal_id: fish.id,
                 checkin: Date.today,
                 checkout: Date.tomorrow,
                 birthdate: Date.today - 3.years)
    end
    context '200' do
      example 'Listing animals' do
        do_request
        expect(status).to eq 200
      end
    end
  end
  post '/pet' do
    parameter :name, 'Pet  name'
    parameter :animal_id, 'References of animal'
    parameter :checkin, 'Date the pet was receveid'
    parameter :checkout, 'Date the pet was adopted'
    parameter :birthdate, 'Date the pet was born'

    let(:name) { 'Agnes' }
    let(:animal_id) { animal.id }
    let(:checkin) { Date.today }
    let(:checkout) { Date.tomorrow }
    let(:birthdate) { Date.today -3.years }


    context '201' do
      example 'Creating a pet' do
        do_request
        expect(status).to eq 201
      end
    end
  end

  put '/pet/:id' do
    with_options scope: :pet do
      parameter :name
    end
    parameter :id, 'pet id whose will be update'
    let(:id) { pet.id }
    let(:name) { 'Jorge' }

    example 'Updating an animal' do
      do_request

      expect(status).to eq(200)
    end
  end
  delete '/pet/:id' do
    parameter :id, required: true
    let(:id) { pet.id }

    example 'Deleting an animal' do
      do_request

      expect(status).to eq(200)
    end
  end
end
