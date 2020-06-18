class CreateHealthPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :health_plans do |t|
      t.string :name
      t.string :description

      t.references :health_insurer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
