class Public::UsersController < ApplicationController
  
  # def index
  #     @post_movies = PostMovie.all
  #     @user = User.where(params[:user_id])
  #     @users = User.where.not(user_id: current_user.id)
  #     #idがcurrent_user以外のidを全て取ってくる  
  # end
  
  def show
      @user = User.find(params[:id])
  end
  
  def followings
      user = User.find(params[:id])
      @users = user.followings
  end
  
  def followers
      user = User.find(params[:id])
      @users = user.followers
  end
 
end
