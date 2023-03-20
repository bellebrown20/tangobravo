class Inquiry < ApplicationRecord
  belongs_to :user
  belongs_to :airplane

  has_many :messages
end
