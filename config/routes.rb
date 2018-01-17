Rails.application.routes.draw do

  devise_for :users
  root 'store/events#index'


  namespace :admin do
    get '/account' => 'account#edit', as: :account
    put '/info' => 'account#update_info', as: :info
    put '/change_password' => 'account#change_password', as: :change_password
    put '/increase_money_state' => 'account#increase_money', as: :increase_money
    get '/archive' => 'events#index', as: :index
    post '/buy_ticket' => 'tickets#buy_ticket', as: :buy_ticket
    post '/receive_ticket' => 'tickets#receive_ticket', as: :receive_ticket
    resources :events
    resources :tickets
  end

  scope module: 'store' do
    get 'events' => 'events#index', as: :events
    get 'events/:id' => 'events#show', as: :event
  end


end
