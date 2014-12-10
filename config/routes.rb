Rails.application.routes.draw do
  get 'home/index' => 'home#index'
  devise_for :users
  
  resources :users
  resources :team_members
  resources :question_queues
  root to: 'home#index'
end
