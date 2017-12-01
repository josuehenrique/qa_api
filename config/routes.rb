Rails.application.routes.draw do
  resources :users, only: [:index, :show]
  resources :questions, only: [:index, :show]
  get :dashboard, controller: :home
end
