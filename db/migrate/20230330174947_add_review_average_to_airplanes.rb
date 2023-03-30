class AddReviewAverageToAirplanes < ActiveRecord::Migration[7.0]
  def change
    add_column :airplanes, :review_average, :float
  end
end
