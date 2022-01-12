# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Animal' do
  get '/animal' do
    example 'Get a list of all animals' do
      do_request
      expect(status).to eq 200
    end
  end
  post '/animal' do
    parameter :name, 'Animal type name'

    example 'Creating an animal' do
      do_request(name: 'Cachorro')
      expect(status).to eq 201
    end
  end
end
