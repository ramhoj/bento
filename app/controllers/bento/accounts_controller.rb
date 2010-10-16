class Bento::AccountsController < ApplicationController
  include InheritedResources::DSL
  inherit_resources

  create! do |success, failure|
    success.html do
      redirect_to params[:referer] == "sign_up" ? new_user_session_url : accounts_url
    end

    failure.html do
      render params[:referer] == "sign_up" ? "sign_up" : "new"
    end
  end

  def sign_up
    build_resource
  end
end
