Rails.application.routes.draw do

  resources :games, only: [:create, :show, :update]
  get 'games/:id/chat', to: "games#chat", as: "chat"
  get 'challenges/index'
  get 'skills/index'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
