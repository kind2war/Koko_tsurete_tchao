Rails.application.routes.draw do

  devise_for :admin,  controllers: {
    registrations: "public/registrations",
    sessions: "admin/sessions"
  }

  devise_for :members,  controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :admin do
    root to: "homes#top", as: "admin"
  end

  scope module: :public do
    root to: "homes#top", as: "root"
    get '/about' => 'homes#about', as: "about"
    resources :parks, only: [:show, :index] do
      resources :reviews, only: [:create]
      collection { post :import }
      collection do
        get 'search'
      end
      #resources :review_comments, only: [:create, :destroy]
    end
    resources :reviews, only: [:show, :edit, :update, :destroy]
    resources :members, only: :index
      get '/mypage', to: 'members#show', as: 'mypage'
  end

end
