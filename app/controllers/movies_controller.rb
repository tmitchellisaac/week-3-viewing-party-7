class MoviesController < ApplicationController
  def index 
    @user = User.find(params[:id])
    @movies = Movie.all
  end 

  def show 
    user = User.find(params[:user_id])
    movie = Movie.find(params[:id])
    if authorize(user.id)
      @user = User.find(params[:user_id])
      @movie = Movie.find(params[:id])
    else
      flash[:error] = "You must be logged in or registered to create a viewing party"
      render :show
      # redirect_to "/users/#{user.id}/movies/#{movie.id}"
    end
  end 
end 