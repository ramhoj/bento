class CustomAccountsController < Bento::AccountsController
  defaults :resource_class => Account, :collection_name => 'accounts', :instance_name => 'account'
  skip_before_filter :authenticate_user!, :only => %w[new]

  def new
    flash[:special] = "Welcome to '#{controller_path}' controller!"
    super
  end
end