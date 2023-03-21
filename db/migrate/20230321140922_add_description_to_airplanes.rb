class AddDescriptionToAirplanes < ActiveRecord::Migration[7.0]
  def change
    add_column :airplanes, :description, :text
  end
end
