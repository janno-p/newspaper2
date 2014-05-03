Rails.application.routes.draw do
  get 'static/log'

  root 'newspapers#index'
  resources :newspapers, only: [:index, :edit, :update, :show]
end
