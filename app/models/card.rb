class Card < ApplicationRecord
  validates :title, presence: true
  validates :image, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  has_one_attached :image
end
