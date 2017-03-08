Rails.application.routes.draw do
  root to: "notes#index"

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :notes, only: [:create, :index, :update, :show, :destroy]
  resources :sessions, only: [:create]
end
