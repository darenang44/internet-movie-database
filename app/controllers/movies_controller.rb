class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :find_movie,  only: [:show, :edit, :update, :destroy]

  def index
    # we now only want to display movie that have the same genre

    # if the genre is blank then display all the movies
    if params[:genre].blank?
      @movies = Movie.all.order('created_at DESC')
    else
      # we are finding the genre by their name Genre.find_by(name: params[:genre]) and then we are getting its id
      @genre_id = Genre.find_by(name: params[:genre]).id
      # we are looking for all the movies that have the same :genre_id as @genre_id
      @movies = Movie.where(:genre_id => @genre_id).order('created_at DESC')
    end
  end

  def show
    if @movie.reviews.blank?
      @avg_review = 0
    else
      @avg_review = @movie.reviews.average(:rating).round(2)
    end
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
    params.require(:movie).permit(:title, :description, :director, :genre_id, :movie_img)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end

end
