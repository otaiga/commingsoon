class Movie::Reminders

  def self.process_reminders(tomorrows_releases)
    return if tomorrows_releases.empty?
    tomorrows_releases.each {|release| send_reminder(release.movie.name, release.user.email)}
  end

private

  def self.send_reminder(movie_name, recipient)
    return unless movie_name && recipient
    scheduled_time = Date.today + 7.hours
    ReminderWorker.perform_at(scheduled_time, movie_name, recipient)
  end

end