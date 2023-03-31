class AddDefaultValueToAirplanesAverageReview < ActiveRecord::Migration[7.0]
  def change
    remove_column :airplanes, :review_average
    add_column :airplanes, :review_average, :float, :default => 0.0
  end
end
