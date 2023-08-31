Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users

  resources :suggestions, only: %i[index show]
  resources :favorites, only: %i[create edit update destroy]
  resources :reviews, only: %i[show new create]
  resources :categories, only: %i[index show]
  resources :chatgpt, only: %i[index]
  resources :google, only: %i[index]

