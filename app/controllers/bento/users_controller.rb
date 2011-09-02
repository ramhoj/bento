class Bento::UsersController < Bento::BaseController
  before_filter :fetch_account
  before_filter :ignore_empty_password, :only => %w[update create]

  create! do |success, failure|
    success.html { redirect_to account_user_url(@account, @user) }
    failure.html { render new_account_user_url(@account) }
  end

  update! do |success, failure|
    success.html { redirect_to account_user_url(@account, @user) }
    failure.html { render edit_account_user_url(@account) }
  end

  destroy! { account_url(@account) }

  private

  def build_resource
    @user = User.new(params[:user])
    @user.accounts << @account
    @user
  end

  def fetch_account
    @account ||= Account.find(params[:account_id])
  end

  def ignore_empty_password
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password_confirmation].blank?
  end
end
