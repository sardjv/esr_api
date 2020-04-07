require 'sidekiq/web'

Rails.application.routes.draw do
  root 'pages#home'

  namespace :api do
    namespace :v1 do
      jsonapi_resources :absence_records
      jsonapi_resources :person_records
    end
  end

  # Sidekiq dashboard.
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == ENV['SIDEKIQ_DASHBOARD_USERNAME'] &&
      password == ENV['SIDEKIQ_DASHBOARD_PASSWORD']
  end
  mount Sidekiq::Web => '/sidekiq'

  # Swagger documentation.
  mount Rswag::Api::Engine => 'api_docs'
  mount Rswag::Ui::Engine => 'api_docs'
end
