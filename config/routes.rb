Rails.application.routes.draw do
  root 'chatroom#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  post 'message', to: 'messages#create'

  # web socket connection need to avialable through routes And action cable mounts the routes
  mount ActionCable.server, at: '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
