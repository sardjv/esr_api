require 'sidekiq/web'

Rails.application.routes.draw do
  root 'pages#home'

  # Sidekiq dashboard.
  mount Sidekiq::Web => '/sidekiq'
end
