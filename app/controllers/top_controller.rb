class TopController < ApplicationController
  def main
    render "login_form"
  end

  def login
    user = User.find_by(uid: params[:uid])
    if user && user.authenticate(params[:pass])
      session[:login_uid] = user.id
      redirect_to tweets_path, notice: "ログインしました"
    else
      flash[:alert] = "ログイン失敗"
      render "login_form"
    end
  end

  def logout
    session.delete(:login_uid)
    redirect_to root_path, notice: "ログアウトしました"
  end
end
