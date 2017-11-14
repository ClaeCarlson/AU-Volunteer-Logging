Rails.application.routes.draw do
  get 'pages/home'

  get 'pages/about'

  resources :admins
  resources :volunteer_descriptions
  resources :volunteers
  resources :hours
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
