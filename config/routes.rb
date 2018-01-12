Rails.application.routes.draw do

  devise_for :users
  root 'store/events#index'
  get '/admin', to: 'admin#manage'

  namespace :admin do
    resources :events
  end

  scope module: 'store' do
    get 'events' => 'events#index', as: :events
    get 'events/:id' => 'events#show', as: :event
  end


end
