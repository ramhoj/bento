RailsApp::Application.routes.draw do
  devise_for :users

  resources :custom_accounts, :only => %w[new create]
  resources :all_projects, :only => %w[edit]
  resources :projects

  root :to => "home#index"
end