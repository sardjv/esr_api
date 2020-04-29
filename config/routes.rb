require 'sidekiq/web'

Rails.application.routes.draw do
  namespace :admin do
    resources :absence_records
    resources :assignment_records
    resources :competency_records
    resources :costing_records
    resources :disability_records
    resources :element_records
    resources :location_records
    resources :organisation_records
    resources :person_eit_records
    resources :person_records
    resources :position_eit_records
    resources :position_records
    resources :qualification_records
    resources :sit_records
    resources :training_absence_records

    root to: 'absence_records#index'
  end

  root 'pages#home'

  get 'auth/:provider/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'
  get 'auth_logout' => 'auth0#destroy'

  # Swagger documentation.
  mount Rswag::Ui::Engine => 'api_docs'
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
