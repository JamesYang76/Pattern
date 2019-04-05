Rails.application.routes.draw do
  resources :high_scores
  resources :users
  resources :posts

  resources :users_high_scores
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
