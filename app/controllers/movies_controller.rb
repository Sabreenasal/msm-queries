class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all

    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movies/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_records = Movie.where({ :id => the_id })

    @the_movie = matching_records.at(0)

    render({ :template => "movies/show" })
  end

  def create
    the_movie = Movie.new
    the_movie.title = params.fetch("query_title")
    the_movie.year = params.fetch("query_year")
    the_movie.duration = params.fetch("query_duration")
    the_movie.image_url = params.fetch("query_image_url")
    the_movie.director_id = params.fetch("query_director_id")

    if the_movie.valid?
      the_movie.save
      redirect_to("/movies", { :notice => "Movie created successfully." })
    else
      redirect_to("/movies", { :alert => the_movie.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_movie = Movie.where({ :id => the_id }).at(0)

    the_movie.title = params.fetch("query_title")
    the_movie.year = params.fetch("query_year")
    the_movie.duration = params.fetch("query_duration")
    the_movie.image_url = params.fetch("query_image_url")
    the_movie.director_id = params.fetch("query_director_id")

    if the_movie.valid?
      the_movie.save
      redirect_to("/movies/#{the_movie.id}", { :notice => "Movie updated successfully."} )
    else
      redirect_to("/movies/#{the_movie.id}", { :alert => the_movie.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_movie = Movie.where({ :id => the_id }).at(0)

    the_movie.destroy

    redirect_to("/movies", { :notice => "Movie deleted successfully."} )
  end
end
