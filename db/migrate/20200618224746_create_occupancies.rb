class CreateOccupancies < ActiveRecord::Migration[6.0]
  def change
    create_table :occupancies do |t|
      t.integer :start
      t.integer :finish
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
