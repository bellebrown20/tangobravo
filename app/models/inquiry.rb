class Inquiry < ApplicationRecord
  belongs_to :user
  belongs_to :airplane
  has_one :last_message, -> { order(created_at: :desc) }, class_name: "Message"

  has_many :messages
end
