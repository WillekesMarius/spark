Rails.application.routes.draw do
  root to: "suggestions#index"

  devise_for :users

  resources :suggestions, only: %i[index show] do
    resources :favorites, only: %i[create]
  end

  resources :favorites, only: %i[destroy index update create]

  resources :reviews, only: %i[show new create]
  resources :categories, only: %i[index show]
  resources :chatgpt, only: %i[index]
  resources :pages, only: %i[index profile]
    get "/profile", to: "pages#profile", as: "profile"
end
