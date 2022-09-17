class Public::PostMoviesController < ApplicationController
 before_action :authenticate_user!, except: [:index] 


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
        @post_movie = PostMovie.find(params[:id])
        @post_comment = PostComment.new
        @user = User.find(params[:id])
   end
   
    def edit
        @post_movie = PostMovie.find(params[:id])
    end
    
    def update
        @post_movie = PostMovie.find(params[:id])
    
        if  @post_movie.update(post_movie_params)
            redirect_to post_movie_path(@post_movie.id)
            flash[:notice] = "投稿内容が更新されました。"
        else
            render :edit
        end
    end
   
   def create
        @post_movie = PostMovie.new(post_movie_params)
        @post_movie.user_id = current_user.id
        @post_movie.save
        redirect_to post_movie_path(@post_movie.id)
   end
   
   private
   
   def post_movie_params
      params.require(:post_movie).permit(:title, :story, :review, :situation_id, :site)
   end
   
   def situation_params
      params.require(:situation).permit(:situation_id, :name)
   end
   
   
end
