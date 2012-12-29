require 'open-uri'
module Movie::Release
  ## Going to try to scrape the data from IMDB using nokogiri !! :S
  URL = "http://www.imdb.com/calendar/?region=gb"
  IMDB_URL = "http://www.imdb.com"

  def get_releases(selected_month, selected_year)
    doc = Nokogiri::HTML(open(URL))
    query_hash(clean_values(arranged_keys(doc)), selected_month, selected_year)
  end

  ## Going to try and scrape the movie data.... messy messy
  def get_movie_bio(id)
    doc = Nokogiri::HTML(open(IMDB_URL + "/title/" + id))
    title = doc.css("h1.header").text.split("\n").delete_if {|x| x==""}.first
    bio = doc.css("#maindetails_center_bottom").css(".article p").text
    {:title => title, :bio => bio}
  end

private

  def dates(raw_dates)
    raw_dates.map {|date| date.text }
  end

  def lists(object)
    object.css("#main ul")
  end

# Creating a hash from array of keys with array of values (in this case h4 dates with ul objects)
  def arranged_keys(object)
    hash = {}
    dates(object.css("h4")).each_with_index { |key, index| hash[key] = lists(object)[index] }
    hash
  end

# Creating array for the keys (THIS MAY NEED REFACTORING :D)
  def clean_values(hash)
    hash.map {|h| {h[0] => clean_li_listsings(h[1])} }
  end

# Splitting out the text attributes for each li element
  def clean_li_listsings(li_values)
     li_values.css("li").css("a").map {|li| [li.attributes["href"].value.split("/").last, li.text] }
  end

  def query_hash(object, selected_month, selected_year)
    results = object.map {|response| response if response.keys.first.to_date.strftime("%m, %Y") == "#{selected_month}, #{selected_year}"}
    results.delete_if {|x| x == nil}
  end

# adding in simple method to include extra digit to month.
  def format_month(month)
    month.to_s.insert(0, "0") unless month.to_s.length == 2
  end

end