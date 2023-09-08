Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users

  resources :suggestions, only: %i[index show] do
    resources :favorites, only: %i[create]
  end

  resources :favorites, only: %i[destroy index update create]

  get "/refresh/:id", to: "suggestions#refresh", as: "refresh"

  resources :reviews, only: %i[show new create]
  resources :categories, only: %i[index show]
  resources :chatgpt, only: %i[index]
  resources :pages, only: %i[index profile home]
    get "/profile", to: "pages#profile", as: "profile"
    get "/home", to: "pages#home", as: "home"
end
