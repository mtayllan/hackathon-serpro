class CreateMedicExpertises < ActiveRecord::Migration[6.0]
  def change
    create_table :medic_expertises do |t|
      t.references :expertise, null: false, foreign_key: true
      t.references :medic, null: false, foreign_key: true
    end
  end
end
