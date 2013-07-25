Chattr::Application.routes.draw do
  get '/messages/get/:id/:af', to: 'messages#get'
  authenticated :user do
    root :to => 'home#index'
    match '/manage', to: 'home#manage'
    resources :messages
    resources :boards
  end

  root :to => "home#index"
  devise_for :users
  resources :users
end