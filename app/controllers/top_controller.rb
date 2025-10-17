class TopController < ApplicationController
  def main
    render "login_form"
  end
  
  def login
    user = User.find_by(uid: params[:uid])
    if user && user.pass == params[:pass]
      session[:login_uid] = user.id  # ← ここを uid ではなく user.id に変更！
      redirect_to tweets_path
    else
      flash[:alert] = "ログイン失敗"
      render "login_form"
    end
  end
  
  def logout
    session.delete(:login_uid)
    redirect_to tweets_path
  end
end
