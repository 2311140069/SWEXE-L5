Rails.application.routes.draw do
  # トップ画面＝ログインページ
  root "top#main"

  # ログイン処理
  post "login", to: "top#login"
  delete "logout", to: "top#logout"

  # ユーザー登録関連
  resources :users, only: [:new, :create, :show, :edit, :update]

  # ツイートといいね機能
  resources :tweets
  resources :likes, only: [:create, :destroy]
end
