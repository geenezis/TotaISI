Rails.application.routes.draw do

  resources :projects do
    resources :tasks
    resources :invitations, only: [:new, :create]
  end

  resources :invitations, only: [:index, :destroy] 


  post '/invitations/:id', to: 'invitations#accept'

  root to: "projects#index"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
