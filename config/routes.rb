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
end
