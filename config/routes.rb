require 'sidekiq/web'

Rails.application.routes.draw do
  root 'pages#home'

  # Sidekiq dashboard.
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == ENV['SIDEKIQ_DASHBOARD_USERNAME'] &&
      password == ENV['SIDEKIQ_DASHBOARD_PASSWORD']
  end
  mount Sidekiq::Web => '/sidekiq'
end
