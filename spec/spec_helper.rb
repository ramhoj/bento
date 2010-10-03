ENV["RAILS_ENV"] = "test"

require 'rubygems'
require 'bundler/setup'

require "rails_app/config/environment"
require 'rspec/rails'
require "rails/test_help"

require 'capybara/dsl'

Dir["#{File.expand_path(File.dirname(__FILE__))}/support/*.rb"].each {|f| require f}

Capybara.app = RailsApp::Application

Rspec.configure do |config|
  config.include Capybara
  config.use_transactional_fixtures = true
end