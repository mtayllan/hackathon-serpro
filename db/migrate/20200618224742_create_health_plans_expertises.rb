class CreateHealthPlansExpertises < ActiveRecord::Migration[6.0]
  def change
    create_table :health_plans_expertises do |t|
      t.references :expertise, null: false, foreign_key: true
      t.references :health_plan, null: false, foreign_key: true
    end
  end
end
