Rails.application.routes.draw do
  devise_for :admins
  devise_for :members

  namespace :admin do
    resources :items
    resources :members
    resources :addresses
    resources :admins
    resources :categories
    resources :items
    resources :orders
  end

  namespace :members do
    resources :items
    resources :members
    resources :addresses
    resources :cart_items
    resources :categories
    resources :ordered_items
    resources :orders
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
