Rails.application.routes.draw do
  resources :posts
  devise_for :admins, :controllers => { registrations: 'registrations' } 
  root 'posts#index'
end
