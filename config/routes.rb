Chattr::Application.routes.draw do
  resources :messages


  resources :boards


  authenticated :user do
    root :to => 'home#index'
    match '/manage', to: 'home#manage'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end