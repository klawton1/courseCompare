Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'users#home'
  resources :users, only: [:create, :show, :edit, :update]
  post '/interests', to: 'users#add_course', as: 'interests'

  get '/search', to: 'courses#search', as: 'search_rand'
  get '/search/:q', to: 'courses#search', as: 'search'
  get '/courses/:id', to: 'courses#show', as: 'course'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create', as: 'signin'
  get '/logout', to: 'sessions#destroy'
  
  match "*path", to: 'application#page_not_found', via: :all
end
