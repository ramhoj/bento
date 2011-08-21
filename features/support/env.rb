ENV["RAILS_ENV"] = "test"

require 'rubygems'
require 'bundler/setup'

require File.expand_path("../../spec/rails_app/config/environment", File.dirname(__FILE__))
require "rails/test_help"

require 'cucumber/formatter/unicode' # Remove this line if you don't want Cucumber Unicode support
require 'cucumber/rails/rspec'
require 'cucumber/rails/world'
require 'cucumber/web/tableish'

require 'capybara/dsl'
require 'capybara/rails'
require 'capybara/cucumber'
require 'capybara/session'
require 'rspec'
require 'rspec/rails'

require File.dirname(__FILE__) + "/../../spec/support/blueprints"
Capybara.app = RailsApp::Application

require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
Before { DatabaseCleaner.clean }

require 'elabs_matchers'
LIST_REGEXP = ElabsMatchers::Cucumber::Common::LIST_REGEXP
Transform /^#{LIST_REGEXP}$/ do |list|
  list.gsub('"', '').split(ElabsMatchers::Cucumber::Common::LIST_SEPARATOR)
end
