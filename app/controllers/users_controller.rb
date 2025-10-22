class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(uid: params[:user][:uid],
                     password: params[:user][:password],
                     password_confirmation: params[:user][:password_confirmation])
    if @user.save
      redirect_to root_path, notice: "ユーザー登録完了！ログインしてください。"
    else
      flash[:alert] = "登録に失敗しました。入力を確認してください。"
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: "プロフィールを更新しました。"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :position, :password, :password_confirmation)
  end
  
end
