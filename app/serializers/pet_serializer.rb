class PetSerializer
  include JSONAPI::Serializer

  set_type :pet
  attributes :name, :animal_id, :checkin, :checkout, :birthdate
end
