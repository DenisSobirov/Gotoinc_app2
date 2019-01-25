Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  resources :links
  devise_scope :user do
    get 'profile', to: 'users/registrations#show'
  end

  devise_scope :user do
    authenticated :user do
      root :to => 'links#index', as: :authenticated_root
    end

    unauthenticated do
      root 'links#index', as: :unauthenticated_root
    end
  end
end
