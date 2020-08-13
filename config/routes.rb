Rails.application.routes.draw do
  
  resources :posts 

  root "posts#index"

  post '/posts', to: 'posts#create'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
