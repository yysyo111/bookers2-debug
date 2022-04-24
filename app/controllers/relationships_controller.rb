class RelationshipsController < ApplicationController
  # before_action :authenticate_user!
  
  # フォローするとき
  def create
    # following = current_user.relationships.build(followed_id: params[:user_id])
    # following.destroy
    # redirect_to request.referrer
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end
  
  
  # フォロー外すとき
  def destroy 
    # following = current_user.relationships.find_by(followed_id: params[:user_id])
    # following.save
    # redirect_to request.referrer
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end 
  
  # フォロー一覧
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
  
  # フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
  
end
