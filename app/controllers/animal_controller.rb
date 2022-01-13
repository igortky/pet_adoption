# frozen_string_literal: true

class AnimalController < ActionController::API
  def create
    # render json: Animal.create(name: params[:name]), status: :created
    animal = Animal.create(name: params[:name])
    hash = AnimalSerializer.new(animal).serializable_hash
    render json: hash, status: :created
  end

  def index
    animals = Animal.all
    hash = AnimalSerializer.new(animals).serializable_hash.to_json
    render json: hash, status: :ok
  end

  def destroy
    # render json: Animal.destroy(params[:id]), status: :ok
    animal = Animal.destroy(params[:id])
    hash = AnimalSerializer.new(animal).serializable_hash
    render json: hash, status: :ok
  end

  def update
    # render json: Animal.update(params[:id], name: params[:name]),
    #        status: :ok
    animal = Animal.update(params[:id], name: params[:name])
    hash = AnimalSerializer.new(animal).serializable_hash
    render json: hash, status: :ok
  end

  def show
    animal = Animal.find(params[:id])
    hash = AnimalSerializer.new(animal).serializable_hash
    render json: hash, status: :ok
  end

  private

  def animal_params
    params[:animal].permit(:name)
  end

  # def render json:, html:, status: :no_content
  # end
end
