Rails.application.routes.draw do

  namespace :users do
    resources :sessions, only: [:create]
    resources :registrations, only: [:create]
    delete :logout, to: 'sessions#logout'
    get :logged_in, to: 'sessions#logged_in'
  end

  namespace :api do
    namespace :v1 do
      resources :ideas do
        patch 'update_publication_period', on: :member
      end
      resources :reactions, only: [:create, :destroy]
      resources :responses, only: [:create, :show]
    end
  end
end
