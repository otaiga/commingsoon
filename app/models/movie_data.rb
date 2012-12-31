class MovieData < ActiveRecord::Base
  attr_accessible :release_date, :title_id, :name, :bio, :cast, :image_link
  serialize :cast

  validates_uniqueness_of :title_id

  def self.get_dates(selection)
    query = self.where(release_date: selection.beginning_of_month..selection.end_of_month)
    dates_available = map_dates(query)
    hashed_response(dates_available)
  end


private

  def self.map_dates(query)
    return unless query
    query.group(:release_date).map {|p| p.release_date}
  end

  def self.hashed_response(dates_available)
    clean_response  = {}
    dates_available.each do |date|
      clean_response[date.to_s] = self.where(release_date: date)
    end
    clean_response
  end

end
