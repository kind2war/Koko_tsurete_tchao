Rails.application.routes.draw do
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :members,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root to: "public/homes#top"
  scope module: :public do
    get '/about' => 'homes#about', as: "about"
    resources :parks, only: [:show, :index]
    resources :members
      get 'members/mypage', to: 'members#show', as: 'mypage'
  end

  namespace :admin do
    get '/admin' => 'admin/homes#top', as: "admin_top"
  end
end
