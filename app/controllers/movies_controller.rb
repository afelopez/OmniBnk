class MoviesController < ApplicationController
  before_action :authorize_request
  before_action :find_user, except: :show

  def index
    @movies = @user.movies
    render json: @movies, status: :ok
  end

  def show
    @movie = Movie.find(params[:id])
    render json: @movie, status: :ok
  end

  def create
    if @user.movies.find_by_name(params[:name])
      render json: { errors: 'movie already exists' }, status: :error
    else
      @movie = Movie.new(movie_params)
      @movie.user = @user
      if @movie.save
        render json: @movie, status: :created
      else
        render json: { errors: @movie.errors.full_messages },
              status: :unprocessable_entity
      end
    end
  end

  def update
    
  end

  def delete

  end

  def movie_params
    params.permit(
      :name, :like
    )
  end

  def find_user
    @user = User.find_by_username!(params[:username])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
  end

end
