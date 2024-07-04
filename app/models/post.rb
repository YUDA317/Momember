class Post < ApplicationRecord
  has_many :post_tags
  has_many :tags, through: :post_tags
  has_many_attached :images
  #geocoded_by :address
  #after_validation :geocode

  def get_images
    if images.attached?
      images
    else
      'no_image2.png'
    end
  end


end
