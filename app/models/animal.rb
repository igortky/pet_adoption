class Animal < ApplicationRecord
  has_many :pets, dependent: :destroy
end
