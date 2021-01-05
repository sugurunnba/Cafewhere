Rails.application.routes.draw do
  namespace :user do
    get 'searches/index'
  end
  namespace :user do
    get 'seaches/index'
  end
  get 'seaches/index'
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  get 'genres/index'
  get 'genres/edit'
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
      end
    end
  end

  namespace :user do
    resources :shops
  end

  namespace :user do
    resources :searches do
      collection do
        get "top" => "searches#top"
      end
    end
  end

end
