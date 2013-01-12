require 'open-uri'
module Movie::ReleaseTwo

  MOVIE_INSIDER_URL = "http://www.movieinsider.com/movies/-/"

  def obtain_data(years = 3)
    response = Array.new
    year_array(years).each do |year|
      response << get_releases(year)
    end
    response
  end

  def get_movie_bio(movie_link)
    puts "getting movie link : #{movie_link}"
    doc = Nokogiri::HTML(open(movie_link))
    title = doc.css('#titleTypeBox h1 a').text
    cast = get_cast(doc)
    bio = doc.css('#synopsis p').first.text
    image_link = doc.css('#poster').attribute('src').value

    {:title => title, :bio => bio, :image_link => image_link, :cast => cast}
  end

  def get_releases(year)
    return unless year
    doc = Nokogiri::HTML(open(MOVIE_INSIDER_URL + year))
    fresh_array = arrange_response(doc)
    response = clean_dates(fresh_array, year)
  end

  def clean_dates(fresh_array, year)
    return if fresh_array.empty?
    updated_hash = Hash.new
    fresh_array.each_pair do |key, value|
      begin
        updated_hash[Date.parse(key + year).strftime('%Y-%m-%d')] = value
      rescue ArgumentError
      end
    end
    updated_hash
  end

  def arrange_response(web_response)
    return unless web_response
    results = Hash.new
    web_response.css('li a.yearlyMonth').each do |date|
      results[date.text] = date.parent.parent.css('p a').map {|s| [s.text, s.attribute('href').value]}
    end
    results
  end

  def year_array(years = 3)
    count = years.to_i
    year_array = Array.new
    year_array << Date.today
    for i in 1..count
      year_array << year_array.last + 1.year
    end
    year_array.map {|y| y.year.to_s}
  end

  def get_cast(object)
    cast_list = Array.new
    object.css('table#profileData td#actors a')[0..4].each do |cast|
      cast_list << cast.child.text
    end
    cast_list
  end

end