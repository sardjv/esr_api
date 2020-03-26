require 'sidekiq/web'

Rails.application.routes.draw do
  root 'pages#home'

  # Sidekiq dashboard.
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == 'admin' && password == 'todo_set_from_env'
  end
  mount Sidekiq::Web => '/sidekiq'
end
