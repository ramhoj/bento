ENV["RAILS_ENV"] = "test"

require 'rubygems'
require 'bundler/setup'

require "rails_app/config/environment"
require 'rspec/rails'
require "rails/test_help"

require 'capybara/dsl'
require 'database_cleaner'

Dir["#{File.expand_path(File.dirname(__FILE__))}/support/*.rb"].each {|f| require f}

Capybara.app = RailsApp::Application
DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  config.mock_with :rspec
  config.include Capybara::DSL
  config.use_transactional_fixtures = true
  config.before { DatabaseCleaner.clean }
  config.before(:all)  { Sham.reset(:before_all)  }
  config.before(:each) { Sham.reset(:before_each) }
end