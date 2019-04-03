Rails.application.routes.draw do

  devise_for :users, controllers: { 
    sessions: "users/sessions",
    passwords: "users/passwords", 
    registrations: "users/registrations"
  }

  root to: 'home#index'

  resources :users do 
  	resources :order_requests
end

  resources :order_requests do
  	get 'change_status', on: :member
   end
end
