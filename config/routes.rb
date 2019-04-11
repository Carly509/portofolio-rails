Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   
    get "/",to:"application#home",as:"root"
  
   resources :contractuals
   resources :contracts
   resources :customers

   get 'users/new'
   get 'users/edit'
   get 'users/delete' 

end
