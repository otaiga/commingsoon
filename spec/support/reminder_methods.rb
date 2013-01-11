def create_reminders(user, movie)
  @reminder = user.reminders.create!(movie_title_id: movie.title_id)
end

def given_reminder
  @reminder
end