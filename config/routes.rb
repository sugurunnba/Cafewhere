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
        get 'top'
      end
    end
  end

  namespace :admin do
    resources :shops
  end

  namespace :user do
    resources :users
  end

  namespace :user do
    resources :shops
  end

end
