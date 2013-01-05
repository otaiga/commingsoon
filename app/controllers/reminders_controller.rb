class RemindersController < ApplicationController
  before_filter :authenticate_user!

  def create
    title_id = params[:title_id]
    redirect_to root_path
  end

end
