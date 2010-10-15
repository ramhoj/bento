class ApplicationController < ActionController::Base
  include Bento::Controllers::Helpers
  protect_from_forgery
end
