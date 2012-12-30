class MovieData < ActiveRecord::Base
  attr_accessible :release_date, :title_id, :name, :bio, :cast, :image_link
  serialize :cast

  validates_uniqueness_of :title_id
end
