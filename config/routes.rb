Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  get 'mentorings', to: "pages#mentorings"

  ActiveAdmin.routes(self)
  resources :game_skills, only: [:update]
  resources :users, only: [:show]
  resources :challenges, only: [:index]
  resources :skills, only: [:index, :show]
  resources :games, only: [:create, :show, :update, :index]
  resources :game_skills, only: [] do
    resources :messages, only: [:create, :index, :destroy]
  end
  # get 'games/:id/chat', to: "games#chat", as: "chat"
  # get 'challenges/index'
  # get 'skills/index'

  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
