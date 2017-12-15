Rails.application.routes.draw do
  get 'tags/:tag', to: 'posts#index', as: :tag
  mount Ckeditor::Engine => '/ckeditor'
  resources :posts
  devise_for :admins, :controllers => { registrations: 'registrations' } 
  root 'posts#index'

end
