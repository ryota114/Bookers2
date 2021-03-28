Rails.application.routes.draw do
  # deviseを使用する際にURLとしてusersを含む
  devise_for :users

  root to: "homes#top"

  resources :users, only: [:index,:show]
  resources :books
end
