ENV["RAILS_ENV"] = "test"

require 'rubygems'
require 'bundler/setup'

require "rails_app/config/environment"
require "rails/test_help"

require 'capybara/dsl'

Capybara.app = RailsApp::Application

Rspec.configure do |config|
  config.include Capybara
end