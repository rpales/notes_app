Rails.application.routes.draw do
  root to: "web#index"

  devise_for :users, controllers: { registrations: 'registrations' }

  get 'notes/download', to: 'notes#download'
  resources :notes, only: [:create, :index, :update, :show, :destroy]
  resources :sessions, only: [:create]
end
