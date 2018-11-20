Rails.application.routes.draw do

  get 'users/index'
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products do
  	resources :notes
  	resources :faqs
  	resources :groups
  end

  resources :groups do
  	resources :products
  	get 'add'
  end

  root 'welcome#index'
  match '/users',   to: 'users#index',   via: 'get'

  devise_for :users, :controllers => { registrations: 'registrations' }
end
