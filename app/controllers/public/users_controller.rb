class Public::UsersController < ApplicationController
   before_action :authenticate_user!
  # def index
  #     @post_movies = PostMovie.all
  #     @user = User.where(params[:user_id])
  #     @users = User.where.not(user_id: current_user.id)
  #     #idがcurrent_user以外のidを全て取ってくる  
  # end
  
  def show
      @user = User.find(params[:id])
  end
  
  def edit
      @user = current_user
  end

  def update
      @user = current_user
    
    if  @user.update(user_params)
        redirect_to edit_user_path
        flash[:notice] = "会員情報が更新されました。"
    else
        render :edit
        flash[:notice] = "必要項目を入力してください。"
    end
  end
    
  def followings
      user = User.find(params[:id])
      @users = user.followings
  end
  
  def followers
      user = User.find(params[:id])
      @users = user.followers
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :kana_name, :user_name, :email, :is_deleted)
  end
 
end
