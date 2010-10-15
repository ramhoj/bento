ENV["RAILS_ENV"] = "test"

require 'rubygems'
require 'bundler/setup'

require File.expand_path("../../spec/rails_app/config/environment", File.dirname(__FILE__))
require "rails/test_help"

require 'cucumber/formatter/unicode' # Remove this line if you don't want Cucumber Unicode support
require 'cucumber/rails/rspec'
require 'cucumber/rails/world'
require 'cucumber/rails/active_record'
require 'cucumber/web/tableish'

require 'capybara/dsl'
require 'capybara/rails'
require 'capybara/cucumber'
require 'capybara/session'

require File.dirname(__FILE__) + "/../../spec/support/blueprints"
Capybara.app = RailsApp::Application

require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
Before { DatabaseCleaner.clean }
