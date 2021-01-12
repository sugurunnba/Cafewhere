Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }


  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  root :to => "user/users#top"

  namespace :admin do
    resources :users do
      collection do
        get "top"
      end
    end
  end

  namespace :admin do
    resources :shops
  end

  namespace :admin do
    resources :genres
  end

  namespace :user do
    resources :users, only: [:show, :edit, :update] do
      collection do
        get "top"
        get "about"
        get "quit"
        patch "out"
      end
    end
  end

  namespace :user do
    resources :shops do
      collection do
        get 'reviews' => 'reviews#index'
      end
      resources :reviews, only: [:new, :create, :show, :edit, :update, :destroy]

      # ブックマークのルート
      collection do
        get 'bookmark' => 'bookmarks#show'
      end
      resource :bookmarks, only: [:create, :destroy]

    end
  end

  namespace :user do
    resources :searches
  end

  namespace :user do
    resources :contacts, only: [:new, :create]
  end

end
