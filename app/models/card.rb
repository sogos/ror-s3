class Card < ApplicationRecord


  validates :title, presence: true
  validates :image, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  has_one_attached :image
  before_save :analyze_image_metadata
  def analyze_image_metadata
    if image.attached?
      # Analyze the metadata
      tempfile = attachment_changes['image'].attachable.tempfile
      image_path = tempfile.path
      metadata = MiniMagick::Image.new(tempfile.path)
    end
  end
end
