class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show update destroy ]

# GET /movies
def index
  if request.query_string.present?
    if params[:title]
      @movie = Movie.where(title: params[:title])
      render json: @movie.to_json(:include => [:genre, :characters])
    elsif params[:genre]
      @genre = Genre.find(params[:genre])
      render json: @genre.movies.to_json(:include => [:genre, :characters])
    elsif params[:order]
      @movie = Movie.order(creationdate: params[:order])
      render json: @movie.to_json(:include => [:genre, :characters])
    end
  else
    @movies = Movie.all
    render json: @movies.to_json( :only => [:image, :title, :creationdate])
  end
end

  # GET /movies/1
  def show
    render json: @movie.to_json(:include => [:characters])
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: @movie, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movies/1
  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movies/1
  def destroy
    @movie.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:image, :title, :creationdate, :qualification, :genre_id)
    end
end
