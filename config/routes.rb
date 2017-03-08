Rails.application.routes.draw do
  root to: "api/notes#index"

  devise_for :users, controllers: { registrations: 'api/registrations' }

  namespace :api do
    resources :notes, only: [:create, :index, :update, :show, :destroy]
    resources :sessions, only: [:create]
  end
end
