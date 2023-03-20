class Message < ApplicationRecord
  belongs_to :user
  belongs_to :inquiry

  validates :content, presence: true, length: { in: 2..200 }
end
