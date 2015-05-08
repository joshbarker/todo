Rails.application.routes.draw do

 devise_for :users

 resources :users, only: :show do
   resources :items, only: [:new, :create]
 end

 resources :items, only: [:show, :edit, :update, :destroy]

 root to: 'welcome#index'
 get 'welcome/about'

end