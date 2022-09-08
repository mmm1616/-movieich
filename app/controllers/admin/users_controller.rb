class Admin::UsersController < ApplicationController
  before_action :check_guest, only: [:destroy, :update]

  def index
    @users = User.page(params[:page]).per(10)
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
        @user = User.find(params[:id])
    
    if  @user.update(user_params)
        redirect_to admin_user_path(@user.id)
        flash[:notice] = "会員情報が更新されました。"
    else
        render :edit
    end
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :kana_name, :user_name,:introduction,:is_deleted)
  end
  
  def check_guest
   email = resource&.email || params[:user][:email].downcase
   if email == 'guest@example.com'
     redirect_to root_path, alert: 'ゲストユーザーの変更・削除はできません。'
   end
  end
end
