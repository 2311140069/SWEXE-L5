class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end
  
  def create
    Tweet.create(message: params[:tweet][:message],user_id: params[:tweet][:user_id])
    redirect_to tweets_path
  end
  
  def destroy
    Tweet.find(params[:id]).destroy
    redirect_to tweets_path
  end
end
