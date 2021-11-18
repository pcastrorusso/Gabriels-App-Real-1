Rails.application.routes.draw do
 
   devise_for :users
   resources :gabriels
   get 'home/about'
   
   root 'gabriels#index'
end
