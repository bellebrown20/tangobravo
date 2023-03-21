class AddPhotosToAirplanes < ActiveRecord::Migration[7.0]
  def change
    add_column :airplanes, :photos, :string
  end
end
