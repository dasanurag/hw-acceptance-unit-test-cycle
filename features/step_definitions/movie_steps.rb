Given /^the following movies exist:$/ do |movies_table|
  movies_table.hashes.each do |movie|
	Movie.create!(movie)
  end
end

Then /^the director of "(.+)" should be "(.+)"/ do |movie_name, director_name|
movie  = Movie.find_by(title: movie_name)
visit movie_path(movie)
expect(movie.director).to eq director_name

end
	  
