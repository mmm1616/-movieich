Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: 'admin/sessions'
}
  
  devise_for :users, controllers: {
  registrations: 'public/registrations',
  sessions: 'public/sessions',
  passwords: 'public/passwords'
}

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: 'public' do
   get '/about', to: "homes#about"
  end
  
  scope module: 'public' do
   root to: "post_movies#index"
   resources :post_movies do
       resources :post_comments, only: [:create]
       resources :favorites, only: [:create, :destroy]
   end
  end
  
  scope module: 'public' do
    get '/users/mypage', to: "users#show"
    get '/users/information/edit', to: "users#edit"
    patch '/users/information', to: "users#update"
    get '/users/unsubscribe', to: "users#unsubscribe"
    patch '/users/withdraw', to: "users#withdraw"
  end
  
  scope module: 'public' do
   get '/relationships/following', to: "relationships#following"
   get '/relationships/follower', to: "relationships#follower"
   resources :relationships, only: [:create, :destroy]
  end
  
  namespace :admin do
   root  "homes#top"
  end

  namespace :admin do
    resources :post_movies, only: [:index, :show, :destroy]
  end
  
  namespace :admin do
    resources :situations, only: [:new, :index, :edit, :update, :create]
  end

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
  end
end

