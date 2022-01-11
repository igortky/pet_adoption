class PetController < ApplicationController
  def create
    #(name: params[:name])
    Pet.create(name: params[:name], checkin: params[:checkin],
               checkout: params[:checkout],
               birthdate: params[:birthdate])
  end

  def destroy
    Pet.destroy(params[:id])
  end
end
