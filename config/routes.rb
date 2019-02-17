Rails.application.routes.draw do
  resources :users
  #get 'session/new'

  get 'session/create'

  get 'session/destroy'



  resources :bookmarks
  resources :itinenaries
  resources :reviews
  resources :tours

 get 'tour' => 'tour#index'
 controller :session do
  get 'login' => :new
  post 'login' => :create
  delete 'logout' => :destroy
 end

 root 'session#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
