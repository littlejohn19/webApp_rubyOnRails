Rails.application.routes.draw do
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root 'home#home'
  root 'events#index'
  get '/admin', to: 'admin#manage'

end
