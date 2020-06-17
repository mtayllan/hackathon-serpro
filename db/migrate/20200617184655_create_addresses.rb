class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :street
      t.string :number
      t.string :zipcode
      t.string :state
      t.string :neighborhood
      t.string :latitude
      t.string :longitude
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
