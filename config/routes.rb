Rails.application.routes.draw do
  get 	'sessions/new'
  get  	'users/new'
  root  'static_pages#home'
  get 	'/help',		      to: 'static_pages#help'					 
  get	'/signup',				  to: 'users#new'
  post	'/signup',				to: 'users#create'
  get	'/login' ,			   	to: 'sessions#new'
  post	'/login' ,				to: 'sessions#create'
  delete '/logout',				to: 'sessions#destroy' 
  resources :users do
    get '/work-list',    to: 'lists#work'
    get '/home-list',    to: 'lists#home'
    resources :lists  do
      member do  
      get  :purpose
      end
    end
  end
  resources :password_resets, only:[:new, :create, :edit, :update]


  
end
