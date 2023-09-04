Rails.application.routes.draw do
  root to: "suggestions#index"

  devise_for :users

  resources :suggestions, only: %i[index show]
  resources :favorites, only: %i[edit update destroy] do
    get "", to: "favorites#favorite", as: "create"
  end

  resources :reviews, only: %i[show new create]
  resources :categories, only: %i[index show]
end
