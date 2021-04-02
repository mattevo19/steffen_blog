Rails.application.routes.draw do
  devise_for :users
  # root to: 'pages#home'
  root to: 'books#index'

  resources :books, only: [:create, :index, :show, :edit, :update, :new, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
