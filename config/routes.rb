Rails.application.routes.draw do
  resources :concept_matches
  resources :concepts
  resources :records
  resources :options
  resources :fields
  resources :documents
  resources :patients
  resources :collections
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "collections#index"
  post '/documents/:id/process_csv', to: 'documents#process_csv', as: :process_csv
  post '/documents/:id/load_patients', to: 'documents#load_patients', as: :load_patients
end
