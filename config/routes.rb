Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get '/member-data', to: 'members#show'
  namespace :api do
    namespace :v1 do
      resources :ideas
    end
  end
end
