class CreateOrganizationSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :organization_settings do |t|
      t.references :interval, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
