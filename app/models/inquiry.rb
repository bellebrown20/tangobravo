class Inquiry < ApplicationRecord
  belongs_to :user
  belongs_to :airplane
end
