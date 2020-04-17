require 'sidekiq/web'

Rails.application.routes.draw do
  # Swagger documentation.
  mount Rswag::Ui::Engine => '/'
  mount Rswag::Api::Engine => 'api_docs'

  namespace :api do
    namespace :v1 do
      jsonapi_resources :absence_records
      jsonapi_resources :assignment_records
      jsonapi_resources :competency_records
      jsonapi_resources :costing_records
      jsonapi_resources :disability_records
      jsonapi_resources :element_records
      jsonapi_resources :location_records
      jsonapi_resources :organisation_records
      jsonapi_resources :person_eit_records
      jsonapi_resources :person_records
      jsonapi_resources :position_eit_records
      jsonapi_resources :position_records
      jsonapi_resources :qualification_records
      jsonapi_resources :sit_records
      jsonapi_resources :training_absence_records
    end
  end

  # Sidekiq dashboard.
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == ENV['SIDEKIQ_DASHBOARD_USERNAME'] &&
      password == ENV['SIDEKIQ_DASHBOARD_PASSWORD']
  end
  mount Sidekiq::Web => '/sidekiq'
end
