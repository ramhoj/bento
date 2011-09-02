class Bento::BaseController < ApplicationController
  include InheritedResources::DSL
  inherit_resources

  before_filter :authenticate_user!, :except => %w[sign_up create]

  protected

  def authenticate_user!
    if current_user.respond_to?(:admin?) and not current_user.admin?
      flash[:alert] = "You are not authorized to access this page."
      redirect_to root_url
    else
      super
    end
  end
end
