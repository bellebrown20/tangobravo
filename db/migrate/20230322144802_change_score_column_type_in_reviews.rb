class ChangeScoreColumnTypeInReviews < ActiveRecord::Migration[7.0]
  def change
    change_column :reviews, :score, :integer
  end
end
