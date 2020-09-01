Rails.application.routes.draw do
  
  patch 'posts/:id', to: 'posts#update'
  
  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

end
