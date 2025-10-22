class LikesController < ApplicationController
    def create
        tweet = Tweet.find(params[:tweet_id])
        user = User.find_by(uid: current_user.uid)
        user.like_tweets << tweet
        redirect_to root_path
    end
    def destroy
        tweet = Tweet.find(params[:id])
        user = User.find_by(uid: current_user.uid)
        tweet.likes.find_by(user_id: user.id).destroy
        redirect_to root_path
    end
    
end
