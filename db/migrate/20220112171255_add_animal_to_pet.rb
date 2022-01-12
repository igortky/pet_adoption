# frozen_string_literal: true

class AddAnimalToPet < ActiveRecord::Migration[6.0]
  def change
    add_reference :pets, :animal, null: false, foreign_key: true
  end
end
