class AddEmergencyBooleans < ActiveRecord::Migration[6.0]
  def change
    add_column :organizations, :has_emergency, :boolean
    add_column :medics, :on_shift, :boolean
  end
end
