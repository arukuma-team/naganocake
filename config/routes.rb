Rails.application.routes.draw do




  devise_for :members, :controllers => {
   :registrations => 'members/registrations',
   :sessions => 'members/sessions'
  }

  root to: 'members/homes#top'

  devise_for :admins, :controllers => {
   :registrations => 'admins/registrations',
   :sessions => 'admins/sessions'
  }

  get '/about' => 'members/homes#about'
  get '/admins' => 'admin/homes#top'


  namespace :admins do
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
    resources :addresses,only: [:new, :create, :index, :edit, :update, :destroy]
    resources :cart_items
    resources :categories
    resources :ordered_items
    resources :orders
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
