# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Animal' do
  let!(:animal) { Animal.create(name: :Dog) }

  get '/animal' do
    let!(:fish) { Animal.create(name: :fish) }
    let!(:guinea_pig) { Animal.create(name: :'guine pig') }
    context '200' do
      example 'Listing animals' do
        do_request
        expect(status).to eq 200
      end
    end
  end

  post '/animal' do
    parameter :name, 'Animal type name', with_example: true
    let(:name) { 'Cachorro' }

    context '201' do
      example 'Creating an animal' do
        do_request
        expect(status).to eq 201
      end
    end
  end

  put '/animal/:id' do
    parameter :name, 'animal type name', required: true
    let(:id) { animal.id }
    let(:name) { 'Updated Name' }

    example 'Updating an animal' do
      do_request

      expect(status).to eq(200)
    end
  end
  delete '/animal/:id' do
    parameter :name, 'animal type name', required: true
    let(:id) { animal.id }

    example 'Deleting an animal' do
      do_request

      expect(status).to eq(200)
    end
  end
end
