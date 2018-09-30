class Picture < ApplicationRecord

  def self.newest_first
    Picture.order("Created_at Desc")
  end

  def self.most_recent_five
    Picture.newest_first.limit(5)
  end

  def self.created_before
    Picture.where("created_at < ?", Time.now - 1.month)
  end

  def pictures_created_in_year(year)
  end

end
