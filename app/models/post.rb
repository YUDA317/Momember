class Post < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many_attached :images
  has_many :post_comments, dependent: :destroy
  #geocoded_by :address
  #after_validation :geocode
  belongs_to :user

  validates :body, presence: true, length: { maximum: 140 }
  validates :images, presence: true
  validates :lat, presence: true
  validates :lng, presence: true

  # after_create do
  #   post = Post.find_by(id: id)
  #   # tag_bodyに打ち込まれたハッシュタグを検出
  #   tags = tag_body.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
  #   tags.uniq.map do |tag|
  #     # ハッシュタグは先頭の#を外した上で保存
  #     tag = Tag.find_or_create_by(tag_name: tag.downcase.delete('#'))
  #     post.tags << tag
  #   end
  # end

  # before_update do
  #   post = Post.find_by(id: id)
  #   post.tags.clear
  #   tags = tag_body.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
  #   tags.uniq.map do |tag|
  #     tag = Tag.find_or_create_by(tag_bane: tag.downcase.delete('#'))
  #     post.tags << tag
  #   end
  # end

  def self.search(search)
    if search != ""
      Post.where('text LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end

  def self.search(keyword)
    where(["body like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
  end

# addresで検索できるようにもしたい
  # def self.looks(search, word)
  #   if search == "perfect_match"
  #     @post = Post.where("body LIKE?","#{word}")
  #   elsif search == "forward_match"
  #     @post = Post.where("body LIKE?","#{word}")
  #   elsif search == "backward_match"
  #     @post = Post.where("body LIKE?","%#{word}")
  #   elsif search == "partial_match"
  #     @post = Post.where("body LIKE?","%#{word}")
  #   else
  #     @post = Post.all
  #   end
  # end

  def get_images
    if images.attached?
      images
    else
      'no_image2.png'
    end
  end

  # def get_images
  #   unless images.attached?
  #     file_path = Rails.root.join('app/assets/images/no_image2.png')
  #     image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  #   else
  #     images
  #   end
  # end
end
