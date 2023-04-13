class MoviesController < ApplicationController
  def index
   @list_of_movies = Movie.all

    render({ :template => "movie_templates/index.html.erb" })
  end

  def movie_details
    movie_id = params.fetch("movie_id")

    @this_movie = Movie.all.where({ :id => movie_id}).at(0)

    @director_id = Movie.where({ :director_id => @this_movie.director_id }).at(0).director_id
          
    render({ :template => "movie_templates/movie_details.html.erb" })
  end
end
