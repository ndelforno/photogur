class Picture < ApplicationRecord
  belongs_to :user

  def self.newest_first
    Picture.order("Created_at Desc")
  end

  def self.most_recent_five
    Picture.newest_first.limit(5)
  end

  def self.created_before
    Picture.where("created_at < ?", Time.now - 1.month)
  end

  # def pictures_created_in_year(year)
  #   @pictures.each do |picture|
  #     if picture.created_at.year == year
  #       return picture
  #     end
  # end

  validates :artist, presence: true
  validates :title, length: { minimum: 2}
  validates :title, length: { maximum: 20}
  validates :url, presence: true
  validates :url, uniqueness: true
end
