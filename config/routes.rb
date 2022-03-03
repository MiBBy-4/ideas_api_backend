Rails.application.routes.draw do
  resources :reactions, only: [:create, :destroy]

  namespace :users do
    resources :sessions, only: [:create]
    resources :registrations, only: [:create]
    delete :logout, to: 'sessions#logout'
    get :logged_in, to: 'sessions#logged_in'
  end

  namespace :api do
    namespace :v1 do
      resources :ideas
      patch 'publication_period_update/:id', to: 'ideas#update_publication_period'
    end
  end
end
