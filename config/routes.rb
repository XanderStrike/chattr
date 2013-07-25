Chattr::Application.routes.draw do
  get '/messages/get/:id/:af', to: 'messages#get'
  authenticated :user do
    root :to => 'home#index'
    match '/manage', to: 'home#manage'
    resources :messages, only: [:create]
    resources :boards, only: [:show, :new, :edit, :create, :update, :destroy]
  end

  root :to => "home#index"
  devise_for :users
  resources :users

  match "*a", :to => "home#404"
end