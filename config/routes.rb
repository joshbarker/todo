Rails.application.routes.draw do

 devise_for :users

 resources :users, only: :show

  # resources :users do 
  #   resources :lists, except: [:index, :destroy]
  # end

  # resources :items, only: [:destroy]

  root to: 'welcome#home'

end
