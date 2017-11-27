Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/home'

  get 'pages/about'

  get 'admins/dashboard', to: 'admins#dashboard'
  get 'admins/volunteers', to: 'admins#volunteers'
  get 'admins/volunteers/:id', to: 'volunteers#show'
  get 'admins/volunteers/:id/edit', to: 'volunteers#edit'
  delete 'admins/volunteers/:id', to: 'volunteers#destroy'
  get 'admins/log_hours', to: 'hours#new'
  get 'admins/register', to: 'volunteers#new'
  get 'admins/reports', to: 'reports#reports'
  resources :admins
  resources :volunteer_descriptions
  resources :volunteers
  resources :hours
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
