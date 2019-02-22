Rails.application.routes.draw do
  resources :bookings
  resources :users
  #get 'session/new'

  get 'session/create'

  get 'session/destroy'

  resources :bookmarks
  resources :itinenaries
  resources :reviews
  resources :tours
  resources :searches

 get 'tour' => 'tour#index'
 controller :session do
  get 'login' => :new
  post 'login' => :create
  delete 'logout' => :destroy
 end
  #get 'search/create'

  #get 'search/destroy'
  #controller :search do
   # get 'search' => :new
   # post 'search' => :create
    #delete 'search' => :destroy
  #end

 root 'session#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
