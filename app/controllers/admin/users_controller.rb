class Admin::UsersController < ApplicationController
    def index
    # @users = User.page(params[:page]).per(10)
    @users = User.find(params[:id])
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
end