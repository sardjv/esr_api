require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'ui/users#index'

  devise_for :users
  namespace :ui do
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
    resources :events, only: %i[index]
    resources :imports, only: %i[index]
    resources :tokens, only: %i[index new create show destroy]
    get '/permissions/:id', to: redirect { |path_params, _req|
      p = Permission.find(path_params[:id])
      # Permissions can be viewed on parent subject.
      "ui/#{p.subject_type.downcase.pluralize}/#{p.subject_id}"
    }, as: 'permission'

    resources :users, only: %i[index edit update destroy]
    get '/users/:id', to: redirect { |path_params, _req|
      # Redirect user_path to edit_user_path.
      "ui/users/#{path_params[:id]}/edit"
    }

    get '/data', to: 'data#index'
  end

  get '/pages/home', to: 'pages#home'

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

  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end
end
