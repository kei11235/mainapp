Rails.application.routes.draw do
  get 'goals/index'
  root to: 'goals#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
