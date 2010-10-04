class Bento::AccountsController < ApplicationController
  include InheritedResources::DSL
  inherit_resources

  create! { new_user_session_url }
end
