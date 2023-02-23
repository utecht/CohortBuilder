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
  # root "articles#index"
end
