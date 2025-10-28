class LikesController < ApplicationController
  before_action :require_login

  # POST /likes?tweet_id=123
  def create
    tweet = Tweet.find(params[:tweet_id])
    # 二重いいね防止
    unless tweet.liked?(current_user)
      tweet.like(current_user)
    end
    redirect_back fallback_location: tweets_path
  end

  # DELETE /likes?tweet_id=123
  def destroy
    tweet = Tweet.find(params[:tweet_id])
    like = tweet.likes.find_by(user_id: current_user.id)
    like&.destroy
    redirect_back fallback_location: tweets_path
  end
end
