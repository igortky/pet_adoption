class PetSerializer
  include JSONAPI::Serializer

  set_type :pet
  attributes :name, :checkin, :checkout, :birthdate
end
