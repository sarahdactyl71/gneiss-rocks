Rails.application.routes.draw do
  root 'rocks#index'

  resources :rocks, only: [:index, :new, :create, :show]
end
