Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :posts
  devise_for :admins, :controllers => { registrations: 'registrations' } 
  root 'posts#index'
end
