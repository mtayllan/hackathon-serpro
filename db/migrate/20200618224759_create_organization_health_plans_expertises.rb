class CreateOrganizationHealthPlansExpertises < ActiveRecord::Migration[6.0]
  def change
    create_table :organization_health_plan_expertises do |t|
      t.references :health_plan, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true
      t.references :expertise, null: false, foreign_key: true
    end
  end
end
