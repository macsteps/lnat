Rails.application.routes.draw do
  get 'orders/create'

  get 'carts/show'

  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  devise_for :users
  root                      'static_pages#home'
  get 'settings',           to: 'static_pages#settings'
  get 'blog/',              to: 'markdown_blog#index'
  get 'blog/*path',         to: 'markdown_blog#show'
  resources :products
end
