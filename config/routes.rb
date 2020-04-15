require 'sidekiq/web'

Rails.application.routes.draw do
  # Swagger documentation.
  mount Rswag::Ui::Engine => '/'
  mount Rswag::Api::Engine => 'api_docs'

  namespace :api do
    namespace :v1 do
      jsonapi_resources :absence_records
      jsonapi_resources :location_records
      jsonapi_resources :person_records
      jsonapi_resources :position_records
    end
  end

  # Sidekiq dashboard.
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == ENV['SIDEKIQ_DASHBOARD_USERNAME'] &&
      password == ENV['SIDEKIQ_DASHBOARD_PASSWORD']
  end
  mount Sidekiq::Web => '/sidekiq'
end
