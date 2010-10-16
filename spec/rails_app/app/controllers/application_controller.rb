class ApplicationController < ActionController::Base
  include InheritedResources::DSL
  protect_from_forgery
end
