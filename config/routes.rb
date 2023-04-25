Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :activities, only: [:index]
      resources :forecast, only: [:index]
    end
  end
end
