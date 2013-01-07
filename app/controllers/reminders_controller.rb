class RemindersController < ApplicationController
  before_filter :authenticate_user!

  def create
    movie_title_id = params[:title_id]
    @reminder = current_user.reminders.new(movie_title_id: movie_title_id)
    @reminder.save
    redirect_to root_path
  end

end
