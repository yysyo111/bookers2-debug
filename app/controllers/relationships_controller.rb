class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  
  # フォローするとき
  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
		redirect_to request.referer
    # current_user.follow(params[:user_id])
    # redirect_to request.referer
  end
  
  
  # フォロー外すとき
  def destroy 
    user = User.find(params[:user_id])
    current_user.unfollow(user)
		redirect_to request.referer
    # current_user.unfollow(params[:user_id])
    # redirect_to request.referer
  end 
  
  # フォロー一覧,あるユーザーがフォローしている人をすべてとる(アソシエションのおかげでとることできる)
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
  # フォロワー一覧、このユーザーをフォローしている人をすべてとる(アソシエションのおかげでとることできる)
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
  
end

