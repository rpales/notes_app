Rails.application.routes.draw do
  root to: "notes#index"

  devise_for :users

  namespace :api do
    resources :notes
  end
end
