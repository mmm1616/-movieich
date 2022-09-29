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
   get 'search', to: "post_movies#search"
   resources :post_movies do
       resources :post_comments, only: [:create, :destroy]
       resource :favorites, only: [:create, :destroy]
   end
  end
  
  scope module: 'public' do
     resources :users, except: [:new, :index, :create, :destroy] do
       
     get 'unsubscribe', to: "users#unsubscribe"
     patch 'withdraw', to: "users#withdraw"
     
     get 'followings', on: :member
     get 'followers', on: :member
     resource :relationships, only: [:create, :destroy]
     
    end
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

