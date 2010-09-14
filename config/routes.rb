# Bento::Application.routes.draw do
Rails.application.routes.draw do
  resources :accounts, :controller => 'bento/accounts', :only => %w[new]
end
