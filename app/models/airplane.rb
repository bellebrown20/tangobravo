class Airplane < ApplicationRecord
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :inquiries, dependent: :destroy
  has_many :messages, through: :inquiries
  has_many :users, through: :inquiries
  has_many :reviews, dependent: :destroy

  def calculate_review_average
    review_average = 0.0
    if reviews.count.positive?
      reviews.reload.each do |review|
        review_average += review.score
      end
      review_average = (review_average / reviews.size).to_f
    else
      0.0
    end
  end

  has_many_attached :photos
  validates :make, presence: true
  validates :engines, presence: true
  validates :tailnumber, presence: true
  validates :home_airport, presence: true

  include PgSearch::Model
pg_search_scope :search_by_make_and_engines,
  against: [
    'make',
    'engines',
    'tailnumber',
    'home_airport'
  ],
  using: {
    tsearch: { prefix: true },
    trigram: {
      threshold: 0.02,
      only: [:make]
    }
  }

end
