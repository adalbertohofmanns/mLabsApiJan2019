Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :dependents
      resources :users
    end
  end
end
