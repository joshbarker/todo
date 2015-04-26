Rails.application.routes.draw do

  root to: 'welcome#home'

  devise_for :users

end
