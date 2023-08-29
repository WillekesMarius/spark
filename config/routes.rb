Rails.application.routes.draw do
<<<<<<< Updated upstream
  devise_for :users
  root to: "pages#home"
=======
  root to: "pages#home"

  devise_for :users
  

  resources :
  resources :
  resources :



  get 'categories/index'
  get 'categories/show'
  get 'reviews/show'
  get 'reviews/new'
  get 'reviews/create'
  get 'favorites/create'
  get 'favorites/edit'
  get 'favorites/update'
  get 'favorites/destroy'
  get 'suggestions/index'
  get 'suggestions/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
>>>>>>> Stashed changes

  resources :suggestions, only: %i[index show]
  resources :favorites, only: %i[create edit update destroy]
  resources :reviews, only: %i[show new create]
  resources :categories, only: %i[index show]
end
