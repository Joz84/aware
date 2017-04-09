Rails.application.routes.draw do

  resources :games, only: [:create, :show, :update]
  get 'games/:id/chat', to: "games#chat", as: "chat"
  get 'challenges/index'
  get 'skills/index'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
