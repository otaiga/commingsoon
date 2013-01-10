class Reminder < ActiveRecord::Base
  attr_accessible :movie_title_id
  belongs_to :user

  def movie
    return unless self.movie_title_id
    MovieData.find_by_title_id(self.movie_title_id)
  end

  def self.tomorrows_releases
    date = Date.tomorrow
    response = []
    self.all.each do |reminder|
      response << reminder if reminder.movie.release_date == date
    end
    response
  end

end
