class ReminderWorker
  include Sidekiq::Worker

  def perform(movie_name, recipient)
    return unless recipient && movie_name
    send_mail(movie_name, recipient)
  end 

  def send_mail(movie_name, recipient)
    puts "sending mail to #{recipient} with movie : #{movie_name}"
    Moviereminder.send_reminder(movie_name, recipient)
  end

end