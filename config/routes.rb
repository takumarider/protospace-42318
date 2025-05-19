Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: :create 
  end
  resources :users, only: :show
end


#resources の役割
#resources は RESTfulなURL（ルーティング）と、
#それに対応するコントローラのアクションをまとめて定義する仕組み

#root の役割
#root は アプリのトップページのURL（"/"）をどこに割り当てるかを決めるもの

#devise_for :users の役割
#devise は、Ruby on Railsの中で
#ユーザー認証（ログイン・ログアウト・登録など）を簡単に実装できる仕組み
#これをルーティングに書くと、以下のようなURLとアクションが自動で作られます：

#URL	         HTTPメソッド	      用途
#/users/sign_in 	   GET	   ログインフォーム表示
#/users/sign_in 	   POST	     ログイン処理
#/users/sign_out	  DELETE	   ログアウト処理
#/users/sign_up 	    GET	    新規登録フォーム表示
#/users	              POST	   新規登録処理
#/users/password/new	GET	   パスワード再設定フォーム表示