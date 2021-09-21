Rails.application.routes.draw do
  
 
  devise_for :members, :controllers => {
   :registrations => 'members/registrations',
   :sessions => 'members/sessions'
  }
  devise_for :admins

  root to: 'members/homes#top'
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
    resources :addresses
    resources :cart_items
    resources :categories
    resources :ordered_items
    resources :orders
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
