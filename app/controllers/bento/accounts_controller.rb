class Bento::AccountsController < ApplicationController
  include InheritedResources::DSL
  inherit_resources

  before_filter :authenticate_user!, :except => %w[sign_up create]

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

  protected

  def authenticate_user!
    if current_user.respond_to?(:admin?) and not current_user.admin?
      flash[:alert] = "You are not authorized to access this page."
      redirect_to :root
    else
      super
    end
  end
end
