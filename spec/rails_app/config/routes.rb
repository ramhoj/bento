RailsApp::Application.routes.draw do
  devise_for :users

  root :to => "home#index"
  resources :custom_accounts, :only => %w[new create]
  resources :projects, :only => %w[index]
end