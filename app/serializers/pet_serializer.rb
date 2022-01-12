# frozen_string_literal: true

class PetSerializer
  include JSONAPI::Serializer

  set_type :pet
  attributes :name, :animal_id, :checkin, :checkout, :birthdate
end
