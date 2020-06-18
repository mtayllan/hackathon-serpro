class CreateOrganizationHealthPlansExpertises < ActiveRecord::Migration[6.0]
  def change
    create_table :organization_health_plans_expertises do |t|
      t.references :health_plans_expertise, null: false, foreign_key: true, index: { name: :plans_expertise }
      t.references :organization, null: false, foreign_key: true
    end
  end
end
