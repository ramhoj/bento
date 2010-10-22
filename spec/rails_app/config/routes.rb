RailsApp::Application.routes.draw do
  devise_for :users

  resources :custom_accounts
  resources :all_projects, :only => %w[edit]
  resources :projects

  resources :scoping_accounts do
    resources :projects
  end

  root :to => "home#index"
end