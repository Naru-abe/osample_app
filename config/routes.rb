Rails.application.routes.draw do
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # 会員用
  # URL /end_users/sign_in ...
  devise_for :end_users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # ゲストログイン用
  devise_scope :end_user do
    post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  namespace :admin do
    get '/' => 'homes#top'
    resources :post, only: [:index, :shou, :destroy] do
      resources :post_comments, only: [:index, :shou, :destroy]
      resources :tags, except: [:new]
    end
    resources :end_users, only: [:index, :show, :edit, :update]
  end

  scope module: :public do
    get '/' => 'homes#top'
    get 'about' => 'homes#about'
    resources :end_users, only: [:index, :show, :edit, :update]
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    get 'end_users/unsubscribe' => 'end_users#unsubscribe'
    patch '/end_users/withdraw' => 'end_users#withdraw'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
