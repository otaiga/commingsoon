class MainController < ApplicationController
  include Movie::Release

  def index
    
  end

  def results
    month = format_month(params[:date][:month].to_s)
    @response = get_releases(month, params[:date][:year])
  end

  def film_info
    @info = get_movie_bio(params[:id])
  end
end
