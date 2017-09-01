Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      # /api/v1/users
      resources :users, only: [:create, :update]
      
      # /api/v1/auth
      post '/auth', to: "auth#login"
      post '/auth/refresh', to: "auth#refresh"

      # /api/v1/teams
      resources :teams, only: [:create, :update]

      # /api/v1/messages
      resources :messages, only: [:create, :destroy]

      # /api/vi/sub_sports
      resources :sub_sports, only: [:create]

      # /api/v1/sports
      resources :sports, only: [:create]

      # /api/v1/games
      resources :games, only: [:create, :update]

      # /api/v1/chat_rooms
      resources :chat_rooms, only: [:update]
    end
  end
end
