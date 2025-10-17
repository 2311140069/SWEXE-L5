class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:edit, :update, :destroy]
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    User.create(uid: params[:user][:uid],pass: params[:user][:pass])
    redirect_to root_path
  end
  
  def edit
  end
  
  def show
  end
  
  def update
    if @user.update(user_params)
      redirect_to @user, notice: "プロフィールを更新しました。"
    else
      render :edit
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end
  
  private

  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:uid, :pass, :name, :position)
  end

  def require_login
    redirect_to root_path, alert: "ログインが必要です" unless session[:login_uid] == @user.id
  end
  
end
