class CreateHealthInsurers < ActiveRecord::Migration[6.0]
  def change
    create_table :health_insurers do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
