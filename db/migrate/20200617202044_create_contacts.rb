class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.int :kind
      t.string :value
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
