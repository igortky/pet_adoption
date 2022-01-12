class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.references :animal, foreign_key: true
      t.date :checkin
      t.date :checkout
      t.date :birthdate

      t.timestamps
    end
  end
end
