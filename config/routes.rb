Rails.application.routes.draw do
  get 'likes/create'
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  root to: 'goals#index'
  resources :goals do
    resources :tasks
    resources :completions
    resources :likes, only: [:create, :destroy]
  end
  resources :likes, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
