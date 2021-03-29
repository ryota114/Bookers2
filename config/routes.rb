Rails.application.routes.draw do
  # deviseを使用する際にURLとしてusersを含む
  devise_for :users

  root to: "homes#top"

  get "home/about" => "homes#about", as: "about_home"

  resources :users, only: [:index,:show]
  resources :books
end
