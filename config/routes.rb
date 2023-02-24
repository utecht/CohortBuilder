Rails.application.routes.draw do
  resources :field_groups, only: [:index, :show, :update, :destroy, :create]
  resources :concept_matches
  resources :concepts
  resources :records
  resources :sting_records, controller: :records
  resources :options
  resources :fields
  resources :documents do
    resources :field_groups, only: [:edit, :new]
  end
  resources :patients
  resources :collections
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "collections#index"
  post '/documents/:id/process_csv', to: 'documents#process_csv', as: :process_csv
  post '/fields/:id/create_records', to: 'fields#create_records', as: :create_records

  # cohort builder API routes
  get '/semapi/collections', to: 'cohort_builder_api#collections', as: :api_collections
  get '/semapi/config', to: 'cohort_builder_api#config_api', as: :api_config
  get '/semapi/data/api_query/:id', to: 'cohort_builder_api#api_query', as: :api_query
  get '/semapi/data/api_query_calc/:id', to: 'cohort_builder_api#api_query_calc', as: :api_query_calc
  get '/semapi/data/api_query_date/:id', to: 'cohort_builder_api#api_query_date', as: :api_query_date
  get '/semapi/data', to: 'cohort_builder_api#api_data', as: :api_data
end
