# frozen_string_literal: true

class AddEmergencyBooleans < ActiveRecord::Migration[6.0]
  def change
    add_column :organizations, :has_emergency, :boolean
    add_column :medics, :on_shift, :boolean, default: false
    # Ex:- :default =>''
  end
end
