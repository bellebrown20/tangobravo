class Airplane < ApplicationRecord
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :inquiries, dependent: :destroy
  has_many :messages, through: :inquiries
  has_many :users, through: :inquiries

  has_many_attached :photos
  validates :make, presence: true
  validates :engines, presence: true
  validates :tailnumber, presence: true
  validates :home_airport, presence: true

  # include PgSearch::Model
  # pg_search_scope :search_by_brand_and_model,
  #   against: [ :brand, :model ],
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }


end
