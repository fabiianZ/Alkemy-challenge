Rails.application.routes.draw do
  resources :characters
  resources :genres
  resources :character_movies
  resources :movies
  devise_for :users, skip: %i[registrations sessions passwords]
  devise_scope :user do
    post '/signup', to: 'registrations#create' 	
    post '/login', to: 'sessions#create'			
    delete '/logout', to: 'sessions#destroy'		
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
