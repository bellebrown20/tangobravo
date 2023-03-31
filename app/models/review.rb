class Review < ApplicationRecord
  belongs_to :airplane
  belongs_to :user
  after_save :update_airplane_review_average
  after_destroy :update_airplane_review_average

  def update_airplane_review_average
    airplane.update(review_average: airplane.calculate_review_average)
  end

  validates :score, presence: true, numericality: { less_than: 5.01, greater_than_or_equal_to: 0.0 }
  validates :content, presence: true, length: { in: 20..200 }
end
