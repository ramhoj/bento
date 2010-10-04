class Bento::AccountsController < Bento::ApplicationController
  inherit_resources

  create! { new_user_session_url }
end
