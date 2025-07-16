class Job < ApplicationRecord
  belongs_to :user

  # For image upload with Active Storage
  has_one_attached :image

  # Validations for the new fields
  validates :title, :description, :location, presence: true
  validates :hourly_price, :price_per_m2, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  # Validate attached image
  validate :image_format

  private

  def image_format
    if image.attached? && !image.content_type.in?(%w[image/jpeg image/png image/gif])
      errors.add(:image, "must be a JPEG, PNG, or GIF")
    end
  end
end
