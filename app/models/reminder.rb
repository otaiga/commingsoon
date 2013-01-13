class Reminder < ActiveRecord::Base
  attr_accessible :movie_title_id, :status
  belongs_to :user

  def movie
    return unless self.movie_title_id
    MovieData.find_by_title_id(self.movie_title_id)
  end

  def self.tomorrows_releases
    date = Date.tomorrow
    response = []
    self.new_reminders.each do |reminder|
      response << reminder if reminder.movie.release_date == date
    end
    response
  end

  def self.new_reminders
    self.where(status: "new")
  end

  def self.processed_reminders
    self.where(status: "processed")
  end

end
