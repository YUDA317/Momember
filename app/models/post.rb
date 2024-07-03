class Post < ApplicationRecord
  has_many :post_tags
  has_many :tags, through: :post_tags
  has_one_attached :image
  #geocoded_by :address
  #after_validation :geocode

  def get_image
    if image.attached?
      image
    else
      'no_image2.png'
    end
  end
end
