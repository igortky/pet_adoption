# frozen_string_literal: true

class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.string :name

      t.timestamps
    end
  end
end
