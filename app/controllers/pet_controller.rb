class PetController < ApplicationController
  def create
    #(name: params[:name])
    pet = Pet.create(name: params[:name], checkin: params[:checkin],
                     checkout: params[:checkout],
                     birthdate: params[:birthdate])
    hash = PetSerializer.new(pet).serializable_hash
    render json: hash, status: :created
  end

  def destroy
    pet = Pet.destroy(params[:id])
    hash = PetSerializer.new(pet).serializable_hash
    render json: hash, status: :ok
  end

  def index
    pet = Pet.all
    hash = PetSerializer.new(pet).serializable_hash
    render json: hash, status: :ok
  end
end
