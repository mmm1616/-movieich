class Public::UsersController < ApplicationController
   before_action :authenticate_user!
   before_action :ensure_normal_user, only: [:update]
  
  def show
      @user = User.find(params[:id])
  end
  
  def edit
      @user = current_user
      @guest_user = User.find_by(email: 'guest@example.com')
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
  
  def unsubscribe
      @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
    flash[:notice]="ご利用いただき、ありがとうございました。"
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
    params.require(:user).permit(:profile_image, :name, :kana_name, :user_name, :email, :is_deleted)
  end
  
  def ensure_normal_user
    if params[:user][:email] == 'guest@example.com'
       redirect_to root_path
       flash[:notice]="ゲストユーザーは更新・削除できません。"
    end
  end
  
end
