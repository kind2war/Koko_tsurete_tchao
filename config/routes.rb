Rails.application.routes.draw do

  scope module: :admin do
    get '/admin' => "homes#top", as: "admin"
  end

  devise_for :admin,  controllers: {
    registrations: "public/registrations",
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :parks
    resources :features, only: [:index, :create, :destroy]
  end

  devise_for :members,  controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: "homes#top", as: "root"
    get '/about' => 'homes#about', as: "about"
    resources :maps, only: [:index]
      get '/map_request', to: 'maps#map', as: 'map_request'
    resources :parks, only: [:show, :index] do
      resources :reviews, only: [:create]
      collection { post :import }
      collection do
        get 'search'
        get "search_tag" => "parks#search_tag"
      end
      #resources :review_comments, only: [:create, :destroy]
    end
    resources :reviews, only: [:show, :edit, :update, :destroy]
    resources :members, only: :index
      get '/mypage', to: 'members#show', as: 'mypage'
  end

end
