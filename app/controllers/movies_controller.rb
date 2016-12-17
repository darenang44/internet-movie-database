class MoviesController < ApplicationController
  before_action :find_movie,  only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all.order('created_at DESC')
  end

  def show
  end

  def new
    # @movie = Movie.new
    @movie = current_user.movies.build

    # we want list the @genres here so when a user creates a new movie post they can assign a genre to it
    # Genre.all will grab all the genres and then were going to map through the genres and list them by name and id
    @genres = Genre.all.map { |genre| [genre.name, genre.id] }
  end

  def create
    # @movie = Movie.new(movie_params)
    @movie = current_user.movies.build(movie_params)

    # we are saying that when we create a movie we need to fill the genre_id colum and we are filling it with the genre's id
    @movie.genre_id = params[:genre_id]

    if @movie.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    # we want list the @genres here so when a user creates a new movie post they can assign a genre to it
    # Genre.all will grab all the genres and then were going to map through the genres and list them by name and id
    @genres = Genre.all.map { |genre| [genre.name, genre.id] }
  end

  def update
    # we are saying that when we create a movie we need to fill the genre_id colum and we are filling it with the genre's id
    @movie.genre_id = params[:genre_id]

    if @movie.update(movie_params)
      redirect_to @movie
    else
      render 'edit'
    end

  end

  def destroy
    @movie.destroy
    redirect_to root_path
  end

  private

  def movie_params
    # we are adding :genre_id to movie_params bc now every movie needs to have a genre
    params.require(:movie).permit(:title, :description, :director, :genre_id)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end

end
