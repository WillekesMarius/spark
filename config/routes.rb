Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :suggestions, only: %i[index show]
  resources :favorites, only: %i[create edit update destroy]
  resources :reviews, only: %i[show new create]
  resources :categories, only: %i[index show]
end
