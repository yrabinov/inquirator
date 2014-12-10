Rails.application.routes.draw do
  get 'home/index' => 'home#index'
  devise_for :users
  #todo: some of these resource routes offer too much. limit them when things settle down.
  resources :users
  resources :team_members
  resources :question_queues
  resources :questions
  root to: 'home#index'
end
