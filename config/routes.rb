Rails.application.routes.draw do

  devise_for :users
  root 'store/events#index'
  get '/admin', to: 'admin#manage'

  namespace :admin do
    get '/account' => 'account#edit', as: :account
    put '/info' => 'account#update_info', as: :info
    put '/change_password' => 'account#change_password', as: :change_password
    resources :events
  end

  scope module: 'store' do
    get 'events' => 'events#index', as: :events
    get 'events/:id' => 'events#show', as: :event
  end


end
