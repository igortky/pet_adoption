require 'rails_helper'

describe AnimalController do
  describe '#create' do
    it 'create a new animal' do
      post '/animal', params: { name: 'Galo' }
      expect(Animal.count).to be 1
      #puts response.body
      expect(response.body).to match_json_schema('animal')
    end

    it 'has the correct name' do
      post '/animal', params: { name: 'Galo' }
      id = JSON.parse(response.body)['data']['id']
      expect(Animal.find(id).name).to be == 'Galo'
    end
  end

  describe '#destroy' do
    before do
      @animal = Animal.create(name: 'Galo')
    end

    it 'remove the animal' do
      delete "/animal/#{@animal.id}"
      expect(Animal.count).to be 0
    end
  end

  describe '#update' do
    before do
      @animal = Animal.create(name: 'Galo')
    end

    it 'changes the animal name' do
      put "/animal/#{@animal.id}", params: { name: 'peixe' }
      expect(@animal.reload.name).to be == 'peixe'
    end
  end

  describe '#show' do
    before do
      @animal = Animal.create(name: 'Galo')
    end
    it 'shows the animal' do
      get "/animal/#{@animal.id}"
      id = JSON.parse(response.body)['data']['id']
      expect(id.to_i).to be == @animal.id
      expect(response.body).to match_json_schema('animal')
    end
  end
end
