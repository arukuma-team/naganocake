Rails.application.routes.draw do
  devise_for :admins
  devise_for :members

  root to: 'members/homes#top'
  get '/about' => 'members/homes#about'

  get '/admins/' => 'admin/homes#top'


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
      get 'members/:id/quit' => 'unsubscribe#quit', as: 'quit_members'
      patch 'members/out/:id' => 'unsubscribe#out', as: 'out_member'
    resources :addresses
    resources :cart_items
    resources :categories
    resources :ordered_items
    resources :orders
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
