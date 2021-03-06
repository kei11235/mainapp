Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  root to: 'goals#index'
  resources :goals do
    resources :tasks
    resources :completions do
      member do
        delete 'completiondelete'
        delete 'movedelete'
      end
    end
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:index, :create, :destroy]
    collection do
      get 'indexlike1'
      get 'indexlike2'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
