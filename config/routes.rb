Rails.application.routes.draw do
  devise_for :admin,  controllers: {
    registrations: "public/registrations",
    sessions: "admin/sessions"
  }

  devise_for :members,  controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root to: "public/homes#top"
  get '/admin' => 'admin/homes#top', as: "admin_top"
  scope module: :public do
    get '/about' => 'homes#about', as: "about"
    resources :parks, only: [:show, :index] do
      #resources :review_comments, only: [:create, :destroy]
      resources :reviews, only: [:show, :index, :create, :destroy]
      collection { post :import }
    end
    get '/mypage', to: 'members#show', as: 'mypage'
    resources :members

  end
end
