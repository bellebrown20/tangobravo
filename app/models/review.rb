class Review < ApplicationRecord
  belongs_to :airplane
  belongs_to :user

  validates :score, presence: true, numericality: { less_than: 5.0, greater_than_or_equal_to: 0.0 }
  validates :content, presence: true, length: { in: 20..200 }
end
