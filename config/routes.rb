Rails.application.routes.draw do

  scope module: :admin do
    get '/admin' => "homes#top", as: "admin"
  end

  devise_for :admin,  controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }

  devise_scope :admin do
    get '/admin/sign_out' => 'devise/sessions#destroy'
  end

  namespace :admin do
    resources :parks
    resources :features, only: [:index, :create, :destroy]
  end

  devise_for :members,  controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :member do
    get '/members/sign_out' => 'devise/sessions#destroy'
  end

  scope module: :public do
    root to: "homes#top", as: "root"
    get '/about' => 'homes#about', as: "about"
    resources :maps, only: [:index]
      get '/map_request', to: 'maps#map', as: 'map_request'
    resources :parks, only: [:show, :index] do
      resources :reviews, only: [:create, :destroy]
      collection { post :import }
      collection do
        get 'search'
        get "search_tag" => "parks#search_tag"
      end
      #resources :review_comments, only: [:create, :destroy]
    end
    resources :members, only: :index
      get '/mypage', to: 'members#mypage', as: 'mypage'
  end

end
