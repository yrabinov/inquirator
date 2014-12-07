Rails.application.routes.draw do
  get 'home/index' => 'home#index'
  devise_for :users
  root to: 'home#index'
end
