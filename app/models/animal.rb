# frozen_string_literal: true

class Animal < ApplicationRecord
  has_many :pets, dependent: :destroy
end
