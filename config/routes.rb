Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users, :path_prefix => 'd', controllers: {
    registrations: 'users/registrations'
  }
  
  match '/users/:id',     to: 'users#show',       via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'patch'
  resources :users, :only =>[:show]
  resources :leaves do
    collection do
      get 'leave_requests' => "leaves#leave_requests" 
      post 'leave_requests' => "leaves#leave_requests" 
    end
    member do
      get 'approve' => "leaves#approve" 
      patch 'approve' => "leaves#approve"

      get 'reject' => "leaves#reject" 
      patch 'reject' => "leaves#reject"
    end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
