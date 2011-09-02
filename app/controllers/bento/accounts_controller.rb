class Bento::AccountsController < Bento::BaseController
  create! do |success, failure|
    success.html do
      redirect_to params[:referer] == "sign_up" ? new_user_session_url : after_create_url
    end

    failure.html do
      render params[:referer] == "sign_up" ? "sign_up" : "new"
    end
  end

  update! { account_url(resource) }
  destroy! { accounts_url }

  def sign_up
    build_resource
  end

  protected

  def after_create_url
    account_url(resource)
  end
end
