Rails.application.routes.draw do

  get 'users/index'
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products do
  	resources :notes
  	resources :faqs
  	resources :groups
    resources :uploads do
    match '/remove', to: 'products#remove', via: 'delete'
    end
  end


  resources :groups do
  	resources :products
  	get 'add'
  end

  resources :studies do
    resources :categories
    resources :products
    get 'add'
    resources :images do
    match '/remove', to: 'studies#remove', via: 'delete'
    end
  end

  resources :categories do
    resources :studies
    get 'add'
  end

  root 'welcome#index'
  match '/users',   to: 'users#index',   via: 'get'

  resources :searches 

  devise_for :users, :controllers => { registrations: 'registrations', :invitations => 'users/invitations' }
  resources :users
end
