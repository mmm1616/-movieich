class Admin::PostMoviesController < ApplicationController
    def index
        @users = User.all
    end
    
    def show
        @post_movie = PostMovie.find(params[:id])
    end
    
    private
  
    def post_movie_params
      params.require(:post_movie).permit(:title, :story, :review, :star, :site)
    end
end
