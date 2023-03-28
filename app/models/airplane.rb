class Airplane < ApplicationRecord
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :inquiries, dependent: :destroy
  has_many :messages, through: :inquiries
  has_many :users, through: :inquiries
  has_many :reviews

  def review_average
    total = 0
    if reviews.count.positive?
      reviews.each do |review|
        total += review.score
      end
      (total / reviews.size).to_f
    else
      return 'N/A'
    end
  end

  has_many_attached :photos
  validates :make, presence: true
  validates :engines, presence: true
  validates :tailnumber, presence: true
  validates :home_airport, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_make_and_engines,
    against: [ :make, :engines ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
