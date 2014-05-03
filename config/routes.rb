Rails.application.routes.draw do
  root 'newspapers#index'
  resources :newspapers, only: [:index, :edit, :update, :show]
end
