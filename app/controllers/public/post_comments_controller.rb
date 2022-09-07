class Public::PostCommentsController < ApplicationController
 def create
   @user = current_user
   @post_movie = PostMovie.find(params[:id])
   
   @post_comment = PostComment.new(post_comment.params)
   @post_comment.save
   redirect_to post_movie_path(@post_movie.id)
 end
 
 private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
