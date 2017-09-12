Rails.application.routes.draw do
  root 'rocks#index'
  namespace :api do
    namespace :v1 do
      resources :rocks, only: [:index, :show]
      end
    end
  resources :rocks, only: [:index, :new, :create, :show]
end
