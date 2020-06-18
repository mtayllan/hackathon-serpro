class CreateIntervals < ActiveRecord::Migration[6.0]
  def change
    create_table :intervals do |t|
      t.string :description
      t.integer :start
      t.integer :finish
      t.integer :step
      t.integer :counts

      t.timestamps
    end
  end
end
