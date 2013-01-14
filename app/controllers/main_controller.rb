class MainController < ApplicationController
  autocomplete :movie_data, :name

  def index
    
  end

  def results
    month = params[:date][:month]
    year = params[:date][:year]
    selection = Date.parse("01-#{month}-#{year}")
    @response = MovieData.get_dates(selection)
  end

  def single_view
    search = params[:search]
    @movie = MovieData.find_by_name(search)
    redirect_to root_path, :notice => "Sorry we couldn't find that movie" unless @movie
  end

end
