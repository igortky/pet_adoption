# frozen_string_literal: true

class AnimalSerializer
  include JSONAPI::Serializer

  set_type :animal
  attributes :name
end
