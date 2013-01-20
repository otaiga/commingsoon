class Moviereminder < ActionMailer::Base
  default from: "from@example.com"

  def send_reminder(movie_name, recipient)
    @user = user
    @movie_name = movie_name
    mail(:to => recipient, :subject => "Your Movie Reminder for Tomorrow's Release").deliver
  end

end
