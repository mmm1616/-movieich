class Public::PostMoviesController < ApplicationController
   def new
      @post_movie = PostMovie.new
      @situation = Situation.all
   end
    
   def index
   
    @post_movies = PostMovie.all

    if params[:situation_id] == nil
    @post_movies = PostMovie.page(params[:page]).per(10)
    else
    post_movies = PostMovie.where(situation_id: params[:situation_id])
    @post_movies = post_movies.page(params[:page]).per(10)
    @situation = Situation.find(params[:situation_id])
    end
    
   end
   
   def show
    @post_movies = PostMovie.find(params[:id])
    @post_comments = post_movie.post_comments.all
    @user = current_user
   end
   
   def create
    @post_movie = PostMovie.new(post_movie_params)
    @post_movie.user_id = current_user.id
    @post_movie.save
    redirect_to post_movie_path(@post_movie.id)
   end
   
   private
   
   def post_movie_params
      params.require(:post_movie).permit(:title, :story, :review, :site, :situation_id)
   end
   
end
