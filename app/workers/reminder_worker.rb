class ReminderWorker
  include Sidekiq::Worker

  def perform(movie_name, recipient, release_id)
    return unless recipient && movie_name && release_id
    update_reminder(release_id) if send_mail(movie_name, recipient)
  end 

  def send_mail(movie_name, recipient)
    return unless movie_name && recipient
    Moviereminder.send_reminder(movie_name, recipient)
  end

  def update_reminder(release_id)
    return unless release_id
    Reminder.find(release_id).update_attributes(status: "processed")
  end

end