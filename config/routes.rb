Rails.application.routes.draw do
  devise_for :users
  root                      'static_pages#home'
  get 'settings',           to: 'static_pages#settings'
  get 'blog/',              to: 'markdown_blog#index'
  get 'blog/*path',         to: 'markdown_blog#show'
  resources :products
end
