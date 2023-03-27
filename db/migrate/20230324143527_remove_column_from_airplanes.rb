class RemoveColumnFromAirplanes < ActiveRecord::Migration[7.0]
  def change
    remove_column :airplanes, :photos
  end
end
