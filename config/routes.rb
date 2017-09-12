Rails.application.routes.draw do

  root 'rocks#index'

  namespace :api do
    namespace :v1 do
      namespace :rocks do
        get '/:id/web_detection', to: 'web_detection#show'
        get '/:id/label_detection', to: 'label_detection#show'
      end
      resources :rocks, only: [:index, :show, :create, :edit, :destroy]
      end
    end

  resources :rocks, only: [:index, :new, :create, :show]
end
