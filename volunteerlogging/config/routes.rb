Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/super_admin', as: 'rails_admin'
  devise_for :admins, path: 'admin', controllers: { sessions: "admins/sessions" , registrations: "admins/registrations"}
  devise_for :volunteers, path: 'volunteer', controllers: { sessions: "volunteers/sessions" , registrations: "volunteers/registrations"}
  
  

  root 'pages#home'
  get 'pages/home'

  get 'pages/about'
  get 'volunteers/home', to: 'volunteers#home'
  get 'volunteers/descriptions', to:'volunteers#descriptions'
  get 'volunteers/hoursworked', to: "volunteers#hoursworked"

  get 'admins/dashboard', to: 'admins#dashboard'
  get 'admins/volunteers', to: 'admins#volunteers'
   get 'admins/volunteers/:id', to: 'volunteers#show'
  get 'admins/volunteers/:id/edit', to: 'volunteers#edit'
  delete 'admins/volunteers/:id', to: 'volunteers#destroy'
  get 'admins/log_hours', to: 'hours#new'
  post 'admins/log_hours', to: 'hours#create'
  get 'admins/register', to: 'volunteers#new'
  get 'admins/reports', to: 'reports#reports'

  resources :admins, :controller => 'admins'
  resources :volunteer_descriptions
  resources :volunteers
  resources :hours
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
