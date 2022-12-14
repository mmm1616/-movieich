class Admin::PostMoviesController < ApplicationController
    
    def index
        @user = User.find(params[:user_id])    
    end
    
    def show
        @post_movie = PostMovie.find(params[:id])
        @post_comments = @post_movie.post_comments.all
    end
    
    def destroy
        @post_movie = PostMovie.find(params[:id]) 
        @post_movie.destroy
        redirect_to admin_root_path(user_id: @post_movie.user_id)
        flash[:notice]="削除しました。"
    end
    
    private
  
    def post_movie_params
        params.require(:post_movie).permit(:title, :story, :review, :user_id, :site)
    end
    
end
