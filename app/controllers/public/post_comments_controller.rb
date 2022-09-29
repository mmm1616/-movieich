class Public::PostCommentsController < ApplicationController
 
 def create
     post_movie = PostMovie.find(params[:post_movie_id])
     comment = current_user.post_comments.new(post_comment_params)
     comment.post_movie_id = post_movie.id
     comment.save
     redirect_to post_movie_path(post_movie.id)
 end
 
 def destroy
     @post_comment = PostComment.find_by(id: params[:id], post_movie_id: params[:post_movie_id]).destroy
     @post_comment.destroy
     redirect_to post_movie_path(params[:post_movie_id])
 end
 
 private
 
  def post_comment_params
      params.require(:post_comment).permit(:comment, :user_name)
  end
  
end
