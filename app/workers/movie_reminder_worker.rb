class MovieReminderWorker
  include Movie::ReleaseTwo

  def perform
    get_movie_info
    get_movie_details
  end

  def get_movie_info
    MovieData.destroy_all
    releases = obtain_data
    releases.each do |release|
      sort_info(release)
    end
  end

  def get_movie_details
    MovieData.all.each do |movie|
      retrieve_details(movie) if movie.title_id
    end
  end

private

  def sort_info(films)
    return if films.empty?
    films.each_pair do |key, values|
      fill_in_movies(key, values)
    end
  end

  def retrieve_details(movie)
    return unless movie
    movie_info = get_movie_bio(movie.title_id)
    movie.update_attributes(bio: movie_info[:bio], cast: movie_info[:cast], image_link: movie_info[:image_link])
  end

  def fill_in_movies(key, values)
    return unless key && !values.empty?
    values.each do |film|
      movie = MovieData.new
      movie.release_date = key
      movie.name = film[0]
      movie.title_id = film[1]
      movie.save
    end
  end

end