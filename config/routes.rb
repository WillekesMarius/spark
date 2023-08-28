Rails.application.routes.draw do
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
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
