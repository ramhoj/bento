ENV["RAILS_ENV"] = "test"

require 'rubygems'
require 'bundler/setup'

require File.expand_path("../../spec/rails_app/config/environment", File.dirname(__FILE__))
require "rails/test_help"

require 'capybara/dsl'
require 'capybara/cucumber'

Capybara.app = RailsApp::Application