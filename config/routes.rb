Rails.application.routes.draw do
  get 'books/index'
  get 'books/show'
  get 'books/create'
  root 'home#index'
  get 'home/about'

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]

  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
