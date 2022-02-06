Rails.application.routes.draw do
  devise_for :businessmen,
  controllers: {
    sessions: 'businessmans/sessions',
    registrations: 'businessmans/registrations'
  }
  get '/member=data', to: 'members#show'
  namespace :api do
    namespace :v1 do
      resources :ideas
    end
  end
end
