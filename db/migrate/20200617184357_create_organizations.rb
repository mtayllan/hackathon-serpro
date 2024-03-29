# frozen_string_literal: true

class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.integer :kind
      t.string :cnes
      t.boolean :covid_attendance
      t.string :cnpj
      t.string :hours
      t.boolean :scheduling

      t.timestamps
    end
  end
end
