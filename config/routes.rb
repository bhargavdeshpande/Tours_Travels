Rails.application.routes.draw do
  get 'session/new'

  get 'session/create'

  get 'session/destroy'

  resources :bookmarks
  resources :logins
  resources :itinenaries
  resources :reviews
  resources :tours
  root 'logins#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
