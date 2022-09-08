class Admin::PostMoviesController < ApplicationController
    def index
        @post_movies = PostMovie.all
    end
    
    def show
        @post_movie = PostMovie.find(params[:id])
        @situation = Situation.find(params[:id])
        @post_comments = @post_movie.post_comments.all
    end
    
    private
  
    def post_movie_params
      params.require(:post_movie).permit(:title, :story, :review, :site)
    end
end
