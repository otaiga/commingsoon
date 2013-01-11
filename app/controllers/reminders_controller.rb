class RemindersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @reminders = cleaned_response(current_user.reminders.new_reminders)
    @processed_reminders = cleaned_response(current_user.reminders.processed_reminders)
  end

  def create
    movie_title_id = params[:title_id]
    reminder = current_user.reminders.new(movie_title_id: movie_title_id)
    if reminder.save
      redirect_to root_path
    end
  end

  def destroy
    reminder = current_user.reminders.find(params[:id])
    if reminder.destroy
      redirect_to reminders_path
    end
  end

private

  def cleaned_response(reminders)
    reminders.each do |reminder|
      reminder.destroy if reminder.movie == nil
    end
  end

end
