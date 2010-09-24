class Bento::AccountsController < Bento::ApplicationController
  helper :form_errors
  inherit_resources

  create! { new_user_session_url }
end
