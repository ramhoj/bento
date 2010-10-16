# Note: In comming versions of Rails, Rails.application
# should be replaced by Bento::Engine
Rails.application.routes.draw do
  resources :accounts, :controller => 'bento/accounts' do
    collection { get :sign_up }
  end
end
