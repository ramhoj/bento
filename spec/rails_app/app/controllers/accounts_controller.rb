class AccountsController < Bento::AccountsController
  def new
    flash[:special] = "Welcome to '#{controller_path}' controller!"
    super
  end
end