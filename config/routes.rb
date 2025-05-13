Rails.application.routes.draw do
  get 'login', to: 'sessions#new' # ログインページ
  get 'sighup', to: 'users#new'  # 新規登録ページ
  root 'prototypes#index'        # その他のルート
end
