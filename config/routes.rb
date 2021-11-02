Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  root to: 'goals#index'
  resources :goals do
    resources :tasks
    resources :completions
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:index, :create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
