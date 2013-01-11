def given_movie
  MovieData.create!(release_date: Date.today, title_id: 1234, name: "Fake Movie", bio: "some bio")
end