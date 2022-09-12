class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    following = current_user.relationships.new(follower_id: params[:user_id])
    #following_idにはcurrent.user_id、follower_idにはparameterから取ってきたuser_idが格納
    following.save
    redirect_to request.referer
  end

  def destroy
    following = current_user.relationships.find_by(follower_id: params[:user_id])
    following.destroy
    redirect_to request.referer
  end

end
