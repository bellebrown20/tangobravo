class AddOwnershipToAirplanes < ActiveRecord::Migration[7.0]
  def change
    add_column :airplanes, :ownership, :string
  end
end
