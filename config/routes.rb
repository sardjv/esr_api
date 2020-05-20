require 'sidekiq/web'

Rails.application.routes.draw do
  namespace :admin do
    resources :absence_records do
      get :export, on: :collection
    end
    resources :assignment_records do
      get :export, on: :collection
    end
    resources :competency_records do
      get :export, on: :collection
    end
    resources :costing_records do
      get :export, on: :collection
    end
    resources :disability_records do
      get :export, on: :collection
    end
    resources :element_records do
      get :export, on: :collection
    end
    resources :location_records do
      get :export, on: :collection
    end
    resources :organisation_records do
      get :export, on: :collection
    end
    resources :person_eit_records do
      get :export, on: :collection
    end
    resources :person_records do
      get :export, on: :collection
    end
    resources :position_eit_records do
      get :export, on: :collection
    end
    resources :position_records do
      get :export, on: :collection
    end
    resources :qualification_records do
      get :export, on: :collection
    end
    resources :sit_records do
      get :export, on: :collection
    end
    resources :training_absence_records do
      get :export, on: :collection
    end

    root to: 'absence_records#index'
  end

  root to: 'pages#home'

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

  constraints lambda { |request| request.session[:userinfo].present? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
