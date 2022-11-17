Rails.application.routes.draw do
   root "users#index"
   resources :users, only: [:index, :show] do 
      resources :posts, only: [:index, :show, :create, :new, :destroy] 
   end   

   resources :posts, only: [:new, :create, :destroy] do 
      resources :comments 
      resources :likes
   end
   
end
