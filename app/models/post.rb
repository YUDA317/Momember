class Post < ApplicationRecord
  has_many :post_tags
  has_many :tags, through: :post_tags
  has_one_attached :image
  #geocoded_by :address
  #after_validation :geocode
end
